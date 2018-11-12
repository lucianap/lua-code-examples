local InteractiveObject = require "InteractiveObject"

local framewidth = 32
local frameheight = 32

local Phone = InteractiveObject:new('more-tiles.png', 32, 32, 8 * framewidth, 6	 * frameheight)

local anuncios = {"Teléfono: Hola?.",
                  "Teléfono: ... ",
                  "Teléfono: Tienes un mensaje de voz",
                  "Teléfono: ...."}

function Phone:new(position)
	local phone = {}
	setmetatable(phone, self)
	phone.position = position
	self.__index = self
	phone.i = 0
	return phone
end


function Phone:interact()
  local i = 1
  return function () anuncio = anuncios[i]; i = i + 1; if(i > #anuncios) then i = 1 end; return anuncio end
end

return Phone