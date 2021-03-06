# Tutorial: Creating Lua-Based HTML Documents

In this tutorial, we will be learning how to create Lua-Based HTML Documents that can be opened in any lua browser.

## Preparing your File

Place a blank .lua file with a unique name into the "lua/htmldocs" directory of your addon. This will be the file containing the code for your HTML document.

## Setting the Base Class

If you would not like to start from scratch, type `LUA_HTML.Base = "BASE CLASS NAME HERE"` in your file to set the desired base class for your document.

## Creating the Head and Body

For the head of your document, type `LUA_HTML.Head = [[HTML HEAD HERE]]`.
Next, type `LUA_HTML.Body = [[HTML BODY HERE]]` to set the body of your document.

## Object Functions

The following are functions that can be used to do certain things with the document.

### LUA_HTML:IsValid()

Checks to see if the object is valid.

Returns:

- bool isvalid: Whether or not the object is valid.

### LUA_HTML:Index()

Returns the unique index of the object.

Returns:

- number index: The unique index of the object.

### LUA_HTML:Remove()

Removes the object, making it no longer valid or useable.

### LUA_HTML:GetClass()

Returns the class name of the object.

Returns:

- string classname: The class name of the object.

### LUA_HTML:GetHead()

Returns the HTML head of the object.

Returns:

- string head: The HTML head of the object.

### LUA_HTML:SetHead(head)

Sets the HTML head of the object.

Arguments:

- string head: The new HTML head for the object.

### LUA_HTML:GetBody()

Returns the HTML body of the object.

Returns:

- string body: The HTML body of the object.

### LUA_HTML:SetBody(body)

Sets the HTML body of the object.

Arguments:

- string body: The new HTML body for the object.

### LUA_HTML:OpenInPanel(HTML)

Opens the document in a DHTML panel.

Arguments:

- Panel HTML: The DHTML panel to open the document in.

### LUA_HTML:OpenNewInCurrentPanel(class, doNotRemove)

Opens a new document in this document's current panel.

Arguments:

- string class: The class name of the new document.
- boolean doNotRemove: Set to true to not remove this document when opening the other one.

### LUA_HTML:RunScript(class, doNotRemove)

Runs a Lua-based script in this document's current panel.

Arguments:

- string class: The class name of the new script.
- boolean doNotRemove: Set to true to not remove the script just after running it.

### LUA_HTML:GetCurrentPanel()

Returns the current panel of the document.

Returns:

- panel currentpanel: The current panel the document was opened in.

## Optional Custom Object Functions

The following are customizable functions that are called whenever certain events happen.

### LUA_HTML:Initialize()

Called when the document is first created.

### LUA_HTML:OnRemove()

Called when the document is removed with its `LUA_HTML:Remove()` function.

### LUA_HTML:OnOpenInPanel(HTML)

Called when the document is opened in a DHTML panel.

Arguments:

- panel HTML: The DHTML panel the document was opened in.

### LUA_HTML:OnRunScript(script)

Called when a Lua-based script (written in JavaScript) is executed on the document.

Arguments:

- LuaJS script: The Lua-based script that was executed on the document.

## Finishing Up

After writing your code, save the file, copy your addon into your addons directory, and test it. If there are any errors, they will show up in the console.
