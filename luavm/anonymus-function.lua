-- FUNCIONES

-- Las funciones en lua son anónimas.
p = print
p("Hello World") --> llama a print
print = math.sin -- print ahora apunta a la función seno 
p(print(1))
sin = p -- ’sin’ ahora contiene la función print
sin(10, 20)

-- -------------------------------------------------

-- Syntactic sugar
function foo (x)
	return 2*x
end
-- es igual a
foo = function (x)
	return 2*x
end

-- -------------------------------------------------

-- Pasaje de función por parámetro

network = {
	{name = "one", IP = "210.26.30.34"},
	{name = "two", IP = "210.26.30.23"},
	{name = "three", IP = "210.26.23.12"},
	{name = "four", IP = "210.26.23.20"},
}

table.sort(network, function (a,b) return (a.name > b.name) end)