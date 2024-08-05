--// UI \\--

local function SendReactMessage(Action, Data)
  exports[SHTemplate.LaptopName]:SendReactMessage(Action, Data)
end

RegisterCommand("testui", function()
  SendReactMessage("TestMessage", {
    message = "Hello from BULGAR DEVELOPMENT!"
  })
end)

RegisterNUICallback("TestFetch", function(data, cb)
    cb("Hello from BULGAR DEVELOPMENT!")
end)

--// App things \\--

local function AddApp()
  if IsAppLoaded then return end
  while GetResourceState(SHTemplate.LaptopName) ~= "started" do
      Wait(500)
  end
  exports[SHTemplate.LaptopName]:AddCustomApp({
      id = exports[SHTemplate.LaptopName]:GetNextFreeId(),
      key = SHTemplate.AppName,
      name = SHTemplate.LaptopAppName,
      ui = "https://cfx-nui-" .. SHTemplate.AppName .. "/web/build/index.html", -- built version
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

CreateThread(function()
  Wait(5000)
  AddApp()
end)

if SHTemplate.EnableApp then
  AddEventHandler("onResourceStart", function(resource)
      if resource == SHTemplate.AppName then
          AddApp()
      end
  end)
end

if SHTemplate.EnableApp then
  AddEventHandler("onResourceStop", function(resource)
      if resource == SHTemplate.AppName then
          exports[SHTemplate.LaptopName]:RemoveCustomApp(SHTemplate.AppName)
      end
  end)
end