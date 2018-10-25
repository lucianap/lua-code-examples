-- CLOSURES

-- Iterador
function values (t)
	local i = 0
	return function () i = i + 1; return t[i]
end

t = {10, 20, 30}
iter = values(t)
-- creates the iterator
while true do
	local element = iter()
	-- calls the iterator
	if element == nil then break end
		print(element)
end