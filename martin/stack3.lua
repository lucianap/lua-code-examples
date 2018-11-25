local libC = require "mylib"

--print(type(libC))

-- Utilizamos la funcion como si la hubieramos definido en Lua.
nombre = libC.c_saludar("TDL")

print("Hola " .. nombre .. "! Desde Lua")
