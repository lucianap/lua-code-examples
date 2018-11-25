function receive (prod)
	local status, value = coroutine.resume(prod)
	return value
end

function send (x)
	coroutine.yield(x)
end

function consumer (prod)
	while true do
		local x = receive(prod) -- get new value
		print("El consumidor recibio ")
		io.write(x, "\n") -- consume new value
	end
end

-- El productor tendrá que ser una corrutina

producer = coroutine.create(function ()
	while true do
		print("El productor solicita un valor: ")
		local x = io.read() -- produce new value
		send(x)
	end
end)

consumer(producer)

