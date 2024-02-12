# HotkeyApps.spoon
HotkeyApps is a plugin for Hammerspoon which allows you to bind hotkeys to guaranteed app windows in the current Space. It behaves similarly to [MenuBarApps](https://github.com/adammillerio/MenuBarApps.spoon).

The application will be automatically moved to the focused space in Mission Control. It can either be clicked out of like normal or hidden by pressing the hotkey again. If the `spacePrecedence` option is set to `true`, then it will check for and open a Space-specific instance of the application in the currently focused Space. This is useful for things like browsers, terminals, and code editors.

# Installation

This Spoon depends on two other Spoons being installed, loaded, and configured:
* [EnsureApp](https://github.com/adammillerio/EnsureApp.spoon).
    * Example app configurations provided below
* [WindowCache](https://github.com/adammillerio/WindowCache.spoon)
    * No configuration needed other than start

## Automated

HotkeyApps can be automatically installed from my [Spoon Repository](https://github.com/adammillerio/Spoons) via [SpoonInstall](https://www.hammerspoon.org/Spoons/SpoonInstall.html). See the repository README or the SpoonInstall docs for more information.

Example `init.lua` configuration which configures `SpoonInstall` and uses it to install and start EnsureApp and HotkeyApps:

```lua
hs.loadSpoon("SpoonInstall")

spoon.SpoonInstall.repos.adammillerio = {
    url = "https://github.com/adammillerio/Spoons",
    desc = "adammillerio Personal Spoon repository",
    branch = "main"
}

spoon.SpoonInstall:andUse("WindowCache", {repo = "adammillerio", start = true})

spoon.SpoonInstall:andUse("EnsureApp", {
    repo = "adammillerio",
    start = true,
    config = {
        apps = {
            ["Obsidian"] = {app = "Obsidian", action = "maximize"},
            ["Arc"] = {
                app = "Arc",
                action = "maximize",
                spacePrecedence = true,
                newWindowConfig = {
                    menuSection = "File",
                    menuItem = "New Window"
                }
            },
            ["Spotify"] = {app = "Spotify", action = "maximize"},
            ["Discord"] = {app = "Discord", action = "maximize"}
        }
    }
})

spoon.SpoonInstall:andUse("HotkeyApps", {
    hotkeys = {
        ["Obsidian"] = {{"cmd", "shift"}, "w"},
        ["Arc"] = {{"cmd", "shift"}, "a"},
        ["Spotify"] = {{"cmd", "shift"}, "s"},
        ["Discord"] = {{"cmd", "shift"}, "d"}
    }
})
```

This will bind the following hotkeys to Cmd+Shift+W/A/S/D respectively:
* Open global window for Obsidian, move it to the current Space, and maximize.
* Open Space-specific window for Arc in the current Space, and maximize.
* Open global window for Spotify, move it to the current Space, and maximize.
* Open global window for Discord, move it to the current space, and maximize.

## Manual

Download the latest WindowCache release from [here.](https://github.com/adammillerio/Spoons/raw/main/Spoons/MenuBarApps.spoon.zip)

Download the latest EnsureApp release from [here.](https://github.com/adammillerio/Spoons/raw/main/Spoons/EnsureApp.spoon.zip)

Download the latest HotkeyApps release from [here.](https://github.com/adammillerio/Spoons/raw/main/Spoons/HotkeyApps.spoon.zip)

Unzip them all and either double click to load the Spoons or place the contents manually in `~/.hammerspoon/Spoons`

Then load the Spoons in `~/.hammerspoon/init.lua`:

```lua
hs.loadSpoon("WindowCache")

hs.spoons.use("WindowCache", {start = true})

hs.loadSpoon("EnsureApp")

hs.spoons.use("EnsureApp", {
    config = {
        apps = {
            ["Obsidian"] = {app = "Obsidian", action = "maximize"},
            ["Arc"] = {
                app = "Arc",
                action = "maximize",
                spacePrecedence = true,
                newWindowConfig = {
                    menuSection = "File",
                    menuItem = "New Window"
                }
            },
            ["Spotify"] = {app = "Spotify", action = "maximize"},
            ["Discord"] = {app = "Discord", action = "maximize"}
        }
    },
    start = true
})

hs.loadSpoon("HotkeyApps")

spoon.HotkeyApps:bindHotkeys(
	["Obsidian"] = {{"cmd", "shift"}, "w"},
	["Arc"] = {{"cmd", "shift"}, "a"},
	["Spotify"] = {{"cmd", "shift"}, "s"},
	["Discord"] = {{"cmd", "shift"}, "d"}
)
```
