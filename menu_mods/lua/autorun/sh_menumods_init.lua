
if SERVER then
	AddCSLuaFile()
end

menumods = {}
menumods.string = {}

local escChars = {
	{"\a", "a"},
	{"\b", "b"},
	{"\f", "f"},
	{"\n", "n"},
	{"\r", "r"},
	{"\t", "t"},
	{"\v", "v"},
	{"\"", "\""},
	{"\'", "\'"},
}

function menumods.string.LevelPush(str, numLevels, noOuterQuotes)
	local numLevels_new = numLevels
	
	if (not numLevels_new) then
		numLevels_new = 1
	end
	
	local newString = ("" .. str)
	
	for i = 1, numLevels_new do
		newString = string.gsub(newString, "\\", "\\\\")
		
		for k, v in pairs(escChars) do
			local pattern1 = string.PatternSafe(v[1])
			local pattern2 = string.PatternSafe(v[2])
			
			newString = string.gsub(newString, pattern1, ("\\" .. pattern2))
		end
		
		if (not noOuterQuotes) then
			newString = ("\"" .. newString .. "\"")
		end
	end
	
	return newString
end

function menumods.string.LevelPop(str, numLevels)
	local numLevels_new = numLevels
	
	if (not numLevels_new) then
		numLevels_new = 1
	end
	
	local newString = ("" .. str)
	
	for i = 1, numLevels_new do
		for k, v in pairs(escChars) do
			local pattern1 = string.PatternSafe(v[1])
			local pattern2 = string.PatternSafe(v[2])
			
			newString = string.gsub(newString, pattern1, "")
			newString = string.gsub(newString, ("^\\" .. pattern2), pattern1)
			newString = string.gsub(newString, ("([^\\])\\" .. pattern2), ("%1" .. pattern1))
		end
		
		newString = string.gsub(newString, "\\\\", "\\")
	end
	
	return newString
end

include("includes/modules/luahtml.lua")
include("includes/modules/luajs.lua")

if SERVER then
	AddCSLuaFile("includes/modules/luahtml.lua")
	AddCSLuaFile("includes/modules/luajs.lua")
end

local files, dirs = file.Find("lua/htmldocs/*.lua", "GAME")

for k, v in ipairs(files) do
	if (not dirs[k]) then
		dirs[k] = "lua/htmldocs"
	end
	
	local filename = (dirs[k] .. "/" .. v)
	
	if (not HTMLFileTable[filename]) then
		local startPos, endPos = string.find(v, "%.lua$")
		
		if startPos then
			local name = string.sub(v, 1, (startPos - 1))
			
			local shouldMount = true
			
			local dirTab = string.Explode("/", dirs[k], false)
			
			if ((#dirTab == 3) and (name == "init")) then
				name = string.lower(dirTab[#dirTab])
			elseif (#dirTab != 2) then
				shouldMount = false
			end
			
			if shouldMount then
				local fullPath = string.gsub((dirs[k] .. "/" .. v), "^lua/", "")
				
				LUA_HTML = {}
				
				LUA_HTML.ClassName = name
				
				if SERVER then
					AddCSLuaFile(fullPath)
				end
				
				include(fullPath)
				
				if (not LUA_HTML.Base) then
					LUA_HTML.Base = "base_html"
				end
				
				luahtml.Register(LUA_HTML, name)
			end
		end
		
		HTMLFileTable[filename] = true
	end
end

for k, v in pairs(luahtml.GetClasses()) do
	if istable(v.BaseClass) then
		for i, j in pairs(v.BaseClass) do
			if (v[i] == nil) then
				v[i] = j
			end
		end
	end
end

local files, dirs = file.Find("lua/jsdocs/*.lua", "GAME")

for k, v in ipairs(files) do
	if (not dirs[k]) then
		dirs[k] = "lua/jsdocs"
	end
	
	local filename = (dirs[k] .. "/" .. v)
	
	if (not JSFileTable[filename]) then
		local startPos, endPos = string.find(v, "%.lua$")
		
		if startPos then
			local name = string.sub(v, 1, (startPos - 1))
			
			local shouldMount = true
			
			local dirTab = string.Explode("/", dirs[k], false)
			
			if ((#dirTab == 3) and (name == "init")) then
				name = string.lower(dirTab[#dirTab])
			elseif (#dirTab != 2) then
				shouldMount = false
			end
			
			if shouldMount then
				local fullPath = string.gsub((dirs[k] .. "/" .. v), "^lua/")
				
				LUA_JS = {}
				
				LUA_JS.ClassName = name
				
				if SERVER then
					AddCSLuaFile(fullPath)
				end
				
				include(fullPath)
				
				if (not LUA_JS.Base) then
					LUA_JS.Base = "base_js"
				end
				
				luajs.Register(LUA_JS, name)
			end
		end
		
		JSFileTable[filename] = true
	end
end

LUA_JS = nil

for k, v in pairs(luajs.GetClasses()) do
	if istable(v.BaseClass) then
		for i, j in pairs(v.BaseClass) do
			if (v[i] == nil) then
				v[i] = j
			end
		end
	end
end

if CLIENT then
	include("includes/extensions/menumods_net.lua")
elseif SERVER then
	AddCSLuaFile("includes/extensions/menumods_net.lua")
	AddCSLuaFile("includes/modules/netdata.lua")
end
