local InteractiveObject = require "InteractiveObject"

local framewidth = 32
local frameheight = 32

-- Donde efectivamente se ejecuta la herencia
local Switch = InteractiveObject:new('switch.png', 32, 32, 0, 0)

local anuncios = {}

function Switch.new(position)
  Switch.position = position
  Switch.interact = Switch:getInteraction()
  Switch.i = 0
  return Switch
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
			anuncio = "Cortaste toda la looz!" 
		end
		return anuncio
	end
end

return Switch