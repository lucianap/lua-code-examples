local InteractiveObject = require "InteractiveObject"

local framewidth = 32
local frameheight = 32

-- Donde efectivamente se ejecuta la herencia
local switch = InteractiveObject:new('switch.png', 32, 32, 0, 0)

local anuncios = {}

function Switch.new(position)
  switch.position = position
  switch.interact = Switch:getInteraction()
  switch.i = 0
  switch.setmetatable(switch, Switch)
  return switch
end

function Switch:getInteraction()
	local on = true
	local anuncio = ""
	-- CLOSURES!
	return function () 
		if(not on) then
			love.graphics.reset()
			on = true
			anuncio = ""
		else
			on = false
			love.graphics.setColor(1, 0, 0)
			anuncio = "Cortaste toda la luz!" 
		end
		return anuncio
	end
end

return Switch