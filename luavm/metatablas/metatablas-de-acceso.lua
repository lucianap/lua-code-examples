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
print(w.width)