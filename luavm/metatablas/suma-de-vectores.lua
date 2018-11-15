-- Arithmetic Metamethods

vector1 = {1,2}
vector2 = {6,2}

-- v3 = vector1+vector2  -- Exception! 

local mt = {} -- metatabla para vectores

function vectorSumFunction(x, y)
	local res = {}
	for i, v in ipairs (x) do
		res[i] = x[i] + y[i]
	end
	return res
end

function vectorSubFunction(x, y)
	local res = {}
	for i, v in ipairs (x) do
		res[i] = x[i] - y[i]
	end
	return res
end

mt.__add = vectorSumFunction -- Le enseña a sumar a los vectores
mt.__sub = vectorSubFunction

setmetatable(vector1, mt)
setmetatable(vector2, mt)
vector3 = vector1+vector2
vector3 = vector2+vector1

-- Los arrays empiezan en 1! (╯°□°）╯︵ ┻━┻
print(vector3[1])
print(vector3[2])

