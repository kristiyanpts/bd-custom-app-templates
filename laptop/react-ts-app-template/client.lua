local key = "react-ts-app-template"
local resourceName = "bd-laptop" -- options:  "bd-laptop"
local currentResourceName = GetCurrentResourceName()
local IsAppLoaded = false

-- If the app should be added when the resource starts.
-- You can also add it as a default app from the bd-laptop config file.
-- Go through the documentation for more information.
local addWithResourceStart = true

---@param action string The action you wish to target
---@param data any The data you wish to send along with this action
function SendUIAction(action, data)
    SendNUIMessage({
        action = action,
        data = data
    })
end

RegisterNUICallback('getClientData', function(_, cb)
    cb('I came from client.lua')
end)

--[[
    YOU CODE HERE
    YOU CODE HERE
    YOU CODE HERE
    YOU CODE HERE
    YOU CODE HERE
    YOU CODE HERE
]]
--

local function AddApp()
    if IsAppLoaded then return end
    while GetResourceState(resourceName) ~= "started" do
        Wait(500)
    end
    Wait(1000)
    exports[resourceName]:AddCustomApp({
        id = exports[resourceName]:GetNextFreeId(),
        key = key,
        name = "App Template",
        ui = "https://cfx-nui-" .. currentResourceName .. "/ui/dist/index.html", -- built version
        -- ui = "http://localhost:3000", -- dev version
        icon = "https://r2.fivemanage.com/pub/fr11gx4axbq6.png",
        itemNeeded = false,
        isDisabled = false,
        canInteract = function()
            -- Anything else besides the things listed above (items, metadata)
            return true
        end
    })
    IsAppLoaded = true
end

CreateThread(function() -- app first load fix
    Wait(5000)
    AddApp()
end)

if addWithResourceStart then
    AddEventHandler("onResourceStart", function(resource)
        if resource == currentResourceName then
            AddApp()
        end
    end)
end

if addWithResourceStart then
    AddEventHandler("onResourceStop", function(resource)
        if resource == currentResourceName then
            exports[resourceName]:RemoveCustomApp(key)
        end
    end)
end
