-- Creación
co = coroutine.create(function () print("hi") end)
print(co)

-- chequear status
print(coroutine.status(co))

-- Ejecutar
coroutine.resume(co)

