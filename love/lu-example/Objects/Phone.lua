local InteractiveObject = require "InteractiveObject"

local framewidth = 32
local frameheight = 32
local Phone = InteractiveObject:new('more-tiles.png', 32, 32, 8 * framewidth, 6	 * frameheight)

local anuncios = {"Skeleton: Hola?.",
                  "Teléfono: Estás despedido. ",
                  "Skeleton: ... ",
                  "Teléfono: Tenés un mensaje de voz",
                  "Teléfono: ...."}

function Phone.new(position)
  Phone.position = position
  Phone.interact = Phone:getInteraction()
  Phone.i = 0
  return Phone
end

function Phone:getInteraction()
	local i = 1
	-- CLOSURES!
	return function () 
		anuncio = anuncios[i]; 
		i = i + 1; 
		if(i > #anuncios) then 
			i = 1 end; 
		return anuncio 
	end
end

return Phone