local InteractiveObject = require "InteractiveObject"

local framewidth = 32
local frameheight = 32

-- Donde efectivamente se ejecuta la herencia
local Leandro = InteractiveObject:new('more-tiles.png', 32, 64, 14 * (framewidth), 14 * (frameheight - 1))

local anuncios = {"Skeleton: Cuál es tu lenguaje preferido?",
				  "Leandro: Perl",
				  "Leandro: Me encanta perl."}

function Leandro.new(position)
  Leandro.position = position
  Leandro.interact = Leandro:getInteraction()
  Leandro.i = 0
  return Leandro
end

function Leandro:getInteraction()
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

return Leandro