package.path = package.path .. ";../ansicolors.lua"
local color = require 'ansicolors'

-- Table-Access Metamethods
-- Ejemplo: Creación con valores default
-- INDEX METAMETHOD

Window = {} -- namespace
Window.prototype = {x=0, y=0, width=100, height=100} -- prototipo con valores default
mt = {} -- metatabla

mt.__index = function (table, key) -- creación del metamethod index
	return Window.prototype[key]
end

w = {x=10, y=20} -- los campos width y height quedan con los valores default
setmetatable(w, mt)

print(color.blue .. "Los campos width y height quedan con los valores default (toman los valores del prototipo)" .. color.reset)
print(color.blue.."Width: "..color.reset..w.width)
print(color.blue.."Height: "..color.reset..w.height)

print(color.blue .. "Pero los valores x e y son los que nosotros seteamos" .. color.reset)
print(color.blue.."X: "..color.reset..w.x)
print(color.blue.."Y: "..color.reset..w.y)