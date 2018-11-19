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
edad = t:edad(2018) 

print(edad)
print(t.intereses[2])
print(t.nombre)
print("\n")
print("\n")
