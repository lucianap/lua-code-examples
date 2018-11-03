-- CLOSURES

-- Iterador




t = {10, 20, 30}

function valores (t)
	local i = 0
	return function () i = i + 1; return t[i] end
end


iter = valores(t)

print(iter())


t = {}

iter()

print(iter())


