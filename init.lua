--- === HotkeyApps===
---
--- Quickly ensure access to apps in the current Space via hotkeys.
---
--- Download: https://github.com/adammillerio/Spoons/raw/main/Spoons/HotkeyApps.spoon.zip
--- 
--- README with Example Usage: [README.md](https://github.com/adammillerio/HotkeyApps.spoon/blob/main/README.md)
local HotkeyApps = {}

HotkeyApps.__index = HotkeyApps

-- Metadata
HotkeyApps.name = "HotkeyApps"
HotkeyApps.version = "0.0.1"
HotkeyApps.author = "Adam Miller <adam@adammiller.io>"
HotkeyApps.homepage = "https://github.com/adammillerio/HotkeyApps.spoon"
HotkeyApps.license = "MIT - https://opensource.org/licenses/MIT"

-- Dependency Spoons
-- EnsureApp is used for handling app movements when showing/hiding.
EnsureApp = spoon.EnsureApp

--- HotkeyApps.logger
--- Variable
--- Logger object used within the Spoon. Can be accessed to set the default log 
--- level for the messages coming from the Spoon.
HotkeyApps.logger = nil

--- HotkeyApps.logLevel
--- Variable
--- HotkeyApps specific log level override, see hs.logger.setLogLevel for options.
HotkeyApps.logLevel = nil

--- EnsureApp:init()
--- Method
--- Spoon initializer method for EnsureApp.
---
--- Parameters:
---  * None
---
--- Returns:
---  * None
function HotkeyApps:init() end

function HotkeyApps:bindHotkeys(mapping)
    local hotkeyBindings = {}

    -- Generate an ensure callback for every app provided by the user.
    for app, hotkey in pairs(mapping) do
        hotkeyBindings[app] = EnsureApp:ensureAppCallback(app)
    end

    -- Bind all provided hotkeys to their ensure callbacks.
    hs.spoons.bindHotkeysToSpec(hotkeyBindings, mapping)
end

return HotkeyApps
