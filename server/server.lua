local RSGCore = exports['rsg-core']:GetCoreObject()

local Notes = {}

RSGCore.Functions.CreateUseableItem("notepad", function(source, _)
    TriggerClientEvent("rsg-notes:client:CreateNote", source)
end)

RegisterNetEvent("rsg-notes:server:CreateNote")
AddEventHandler("rsg-notes:server:CreateNote", function(data)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local firstname = Player.PlayerData.charinfo.firstname
    local lastname = Player.PlayerData.charinfo.lastname
    local fullname = firstname..' '..lastname
    local rnd = math.random
    local charset =
    {
        "q","w","e","r","t","y","u","i","o","p","a","s","d","f","g","h","j","k","l","z","x","c","v","b","n","m",
        "Q","W","E","R","T","Y","U","I","O","P","A","S","D","F","G","H","J","K","L","Z","X","C","V","B","N","M",
        "1","2","3","4","5","6","7","8","9","0"
    }

    local GeneratedID = ""

    for i = 1, 12 do GeneratedID = GeneratedID..charset[rnd(1, #charset)] end

    local coords = json.encode(data.coords)

    MySQL.Async.execute("INSERT INTO notes (id, coords, creator, message) VALUES (@id, @coords, @creator, @message)", {
        ['@id'] = GeneratedID,
        ['@coords'] = coords,
        ['@creator'] = fullname,
        ['@message'] = data.message
    }, function(rowsChanged)
        if rowsChanged > 0 then
            Notes[GeneratedID] =
            {
                id      = GeneratedID,
                coords  = data.coords,
                creator = fullname,
                message = data.message
            }
            TriggerClientEvent("rsg-notes:client:SyncNotes", -1, Notes)
        end
    end)
end)

RegisterNetEvent("rsg-notes:server:DestroyNote")
AddEventHandler("rsg-notes:server:DestroyNote", function(noteId)
    MySQL.Async.execute("DELETE FROM notes WHERE id = @id", {['@id'] = noteId}, function(rowsChanged)
        if rowsChanged > 0 then
            Notes[noteId] = nil
            TriggerClientEvent("rsg-notes:client:SyncNotes", -1, Notes)
        end
    end)
end)

RegisterNetEvent("rsg-notes:server:ReadNote")
AddEventHandler("rsg-notes:server:ReadNote", function(data)
    local src = source
    local note = Notes[data.noteid]
    if note then
        TriggerClientEvent("rsg-notes:client:ReadNote", src, note)
    end
end)

RegisterServerEvent("rsg-notes:server:GetNotes")
AddEventHandler("rsg-notes:server:GetNotes", function()
    local src = source
    MySQL.Async.fetchAll("SELECT * FROM notes", {}, function(notes)
        for _, note in ipairs(notes) do
            local coords = json.decode(note.coords)
            Notes[note.id] =
            {
                id      = note.id,
                coords  = coords,
                creator = note.creator,
                message = note.message
            }
        end
        TriggerClientEvent("rsg-notes:client:SyncNotes", src, Notes)
    end)
end)

RegisterNetEvent("rsg-notes:server:SyncNotes")
AddEventHandler("rsg-notes:server:SyncNotes", function()
    MySQL.Async.fetchAll("SELECT * FROM notes", {}, function(notes)
        TriggerClientEvent("rsg-notes:client:SyncNotes", -1, notes)
    end)
end)
