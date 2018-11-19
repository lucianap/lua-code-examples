package.path = package.path .. ";../ansicolors.lua"
local color = require 'ansicolors'


print(color.green.."Contenido del entorno: "..color.reset)
for k, v in pairs(_G) do
	local key = k
	local value = v
	print(color.green .. k..color.reset.." - Type of value: "..color.red .. type(v))
end