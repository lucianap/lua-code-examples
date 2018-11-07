-- Lazy  
-- Ejemplo: atributo lazy

local clock = os.clock
function sleep(n)  -- seconds
  local t0 = clock()
  while clock() - t0 <= n do end
end

operacionCostosa = function()
	print "voy a dormir"
	sleep(7)
	return 4*4;
end

-- Metatablas para operaciones lazy!
local t = {}
local lazyLoader = {
	__index =  function(tabla, valorRequerido)
					tabla[valorRequerido] = operacionCostosa()
					return tabla[valorRequerido]
				end
}

setmetatable(t, lazyLoader)
print(t.costoso)
print(t.costoso)