![Menu Mods Logo](/Menu_Mods_Logo.png?raw=true "Menu Mods Logo")

# About

Menu Mods is a framework for Garry's Mod that allows the user to modify the main and pause menus. The user can add Lua code that is executed in the menu state of the game, and even add options to the menu.

# Getting Started

## Installation

Once downloaded, place the folder named "menu_mods" inside the "addons" folder in your "garrysmod" directory (usually "C:/Program Files (x86)/Steam/steamapps/common/GarrysMod/garrysmod").

## ConVars

Name | Default | Description
---- | ------- | -----------
menumods_enabled | 1 | Enables the mounting of Lua files in the menu state. Will disable the files only after restarting Garry's Mod.
menumods_debugMode | 0 | Enables printing extra debug info to the console.
menumods_enableLogging | 0 | Enables saving logs of extra debug info into the folder "data/menu_mods/logs".
menumods_net_enabled | 1 | Enables the Menu Mods net library which sends data between the menu and client states.
menumods_net_tickRate | 30 | Sets the number of times per second at which net messages are sent between the menu and client states. Set to 0 for one tick every "Think" event.

## Tutorials

- [Your First Menu Option](/tutorials/your_first_menu_option.md "Your First Menu Option")
- [Creating Lua-Based HTML Documents](/tutorials/creating_lua-based_html_documents.md "Creating Lua-Based HTML Documents")
- [Creating Lua-Based JavaScript Documents](/tutorials/creating_lua-based_javascript_documents.md "Creating Lua-Based JavaScript Documents")

## References

- [Lua Reference](/lua_reference/ROOT.md "Lua Reference")
