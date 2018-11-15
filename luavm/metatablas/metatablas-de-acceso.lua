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

window1 = {x=10, y=20} -- los campos width y height quedan con los valores default
setmetatable(window1, mt)

print(color.yellow .. "Los campos width y height quedan con los valores default (toman los valores del prototipo)" .. color.reset)
print("Width: "..window1.width)
print("Height: "..window1.height)

print(color.yellow .. "Pero los valores x e y son los que nosotros seteamos" .. color.reset)
print("X: "..window1.x)
print("Y: "..window1.y)