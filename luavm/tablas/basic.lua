package.path = package.path .. ";../ansicolors.lua"
local color = require 'ansicolors'


t = {} 

-- tabla como array
t = {4,99,3}

-- tabla como "record"
t = {x = 1, y = 3}

-- tabla como C structs con funciones
t = {
	nombre = "Foo",
	apellido = "Bar",
	anioNacimiento = 1998,
	edad = function (self, anioActual) 
				return anioActual - self.anioNacimiento
		   end,
	intereses = {"parkour", "programacion", "compiladores"}
}


edad = t.edad(t, 2018)
edad = t:edad(2018) -- 

print(edad)
print(t.intereses[2])
print(t.nombre)
print("\n")
print("\n")

print("Contenido del entorno: ")
for k, v in pairs(_G) do
	local key = k
	local value = v
	print(color.green .. k..color.reset.." - Type of value: "..color.red .. type(v))
end