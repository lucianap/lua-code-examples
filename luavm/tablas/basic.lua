package.path = package.path .. ";../ansicolors.lua"
local color = require 'ansicolors'

local function printTable(t) 
	print(color.green .. "Contenido de la tabla t "..color.reset)
	for k, v in pairs(t) do	
		print(k .. ": ")
		print(v)
	end
end

t = {} 

-- printTable(t)

-- tabla como "record"
t = {x = 1, y = 3}

printTable(t)

t.y = "otra cosa"
t.nuevoAtributo = {k = 2, j = 8}

print("\n")
-- print(t["nuevoAtributo"])
-- print(t.nuevoAtributo)
-- print("\n")

t.y = nil

-- printTable(t)

-- tabla como array
t = {4,99,3}

-- printTable(t)

