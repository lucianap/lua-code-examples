-- Arithmetic Metamethods
local mt = {} -- metatabla para vectores

Vector = {}
function Vector.new(l)
	local vector = {}
	setmetatable(vector, mt) -- Se asigna la metatabla a todos los objetos de tipo vector
	for i,v in ipairs(l) do vector[i] = v end
	return vector
end

function Vector.sum(x, y)
	local res = Vector.new{}
	for i, v in ipairs (x) do
		res[i] = x[i] + y[i]
	end
	return res
end

function Vector.sub(x, y)
	local res = Vector.new{}
	for i, v in ipairs (x) do
		res[i] = x[i] - y[i]
	end
	return res
end

mt.__add = Vector.sum -- Le enseña a sumar a los vectores
mt.__sub = Vector.sub

-- ############################################################ 

-- Table-Access Metamethods
-- Creación con valores default:
-- INDEX METAMETHOD
Window = {} -- namespace
Window.prototype = {x=0, y=0, width=100, height=100} -- prototipo con valores default
Window.mt = {} -- metatabla

function Window.new (o)
	setmetatable(o, Window.mt)
	return o
end

Window.mt.__index = function (table, key) -- creación del metamethod index
	return Window.prototype[key]
end

w = Window.new{x=10, y=20} -- los campos width y height quedan con los valores default
print(w.width)

-- ------------------------------------------------------------
-- Proxy para controlar accesos con __index y __newindex
t = {} -- original table (created somewhere)

-- keep a private access to the original table
local _t = t
t = {} 						-- create proxy
local mt = { 				-- create metatable
	__index = function (t, k)
		print("*access to element " .. tostring(k))
		return _t[k]			-- access the original table
	end,
	__newindex = function (t, k, v)
		print("*update of element " .. tostring(k) ..
		" to " .. tostring(v))
		_t[k] = v
		-- update original table
	end
}
setmetatable(t, mt)
t[2] = "aloo"
print(t[2])

-- ------------------------------------------------------------