function fwrite (fmt, ...)
	return io.write(string.format(fmt, ...))
end

function writeheader()
io.write([[
	<html>
	<head><title>Generador de HTML hecho en LUA</title></head>
	<body bgcolor="#FFFFFF">
		Ejemplo de DSL usando LUA <a href="home.html">Lua</a>.
	<br>
]])
end


function writetail ()
	fwrite('</body></html>\n')
end

function entryFunction (o)
	count = count + 1
	fwrite('<hr>\n<h3>\n')
	local href = o.url and string.format(' href="%s"', o.url) or ''
	local title = o.title or o.org or 'org'
	fwrite('<a name="%d"%s>%s</a>\n', count, href, title)
	if o.title and o.org then
		fwrite('<br>\n<small><em>%s</em></small>', o.org)
	end
	fwrite('\n</h3>\n')
	if o.description then
		fwrite('%s<p>\n',
		string.gsub(o.description, '\n\n+', '<p>\n'))
	end
	if o.email then
		fwrite('Contact: <a href="mailto:%s">%s</a>\n',
		o.email, o.contact or o.email)
	elseif o.contact then
		fwrite('Contact: %s\n', o.contact)
	end
end

file = io.open("result.html", "w")
io.output(file) -- salida default de io al archivo creado

local inputfile = 'example.lua'
writeheader()
count = 0
f = loadfile(inputfile)  -- Carga el archivo como código LUA ejecutable.
entry = entryFunction
f()						 -- Llama al chunk en el archivo.
writetail()