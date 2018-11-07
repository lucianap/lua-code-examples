-- Table-Access Metamethods
-- Ejemplo: Proxy de una tabla
-- INDEX METAMETHOD, NEWINDEX METAMETHOD

t = {}                      -- metatabla original

local _t = t                -- la envolvemos en nuestro proxy
t = {} 						-- creamos el proxy
local mt = { 				-- creamos la metatabla
	__index = function (t, k)
		print("*access to element " .. tostring(k))
		return _t[k]									-- acceso a la tabla original
	end,
	__newindex = function (t, k, v)
		print("*update of element " .. tostring(k) ..
		" to " .. tostring(v))
		_t[k] = v 										-- update de la tabla original
	end
}
setmetatable(t, mt)



t[2] = "aloo"
print(t[2])

t[2] = {}
t[2].atributo = 1

t[9] = "str"
