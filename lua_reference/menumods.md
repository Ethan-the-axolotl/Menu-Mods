# menumods

### menumods.include(filename)

Includes an outside file.

Arguments:

- string filename: The name of the .lua file to include.

IMPORTANT: This function must be used in place of the "include" function when in the menu state due to a fatal Lua error in which the file is not found. This function also does not support local file paths, so replace any local file paths with the full Lua file path. Example: If you are including the .lua file "lua/autorun/stuff/test.lua" from another file, type `menumods.include("autorun/stuff/test.lua")` in the desired location.

### menumods.CreateLog(content, extension)

Creates a log in the directory "garrysmod/data/menu_mods/logs" with the given content.

Arguments:

- string content: The content of the log.
- string extension: The file extension of the log. (Ex. `.txt`, `.dat`, etc.)

### menumods.FindID(identifier)

A function that is internally used to find unoccupied indices for custom HTML elements.

Arguments:

- string identifier: The identifier to assign to the index.

Returns:

- number index: The found index.

IMPORTANT: It is highly recommended to refrain from using this function to create luahtml classes unless there is a specific reason for doing so.