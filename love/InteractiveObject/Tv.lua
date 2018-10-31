local InteractiveObject = require "InteractiveObject"

local framewidth = 32
local frameheight = 32
local Tv = InteractiveObject:new('more-tiles.png', 32, 62, 11 * framewidth, 3 * (frameheight+2))

local anuncios = {"TV: Se anuncia tiempo nublado.",
                  "TV: La línea E funciona con demoras.",
                  "TV: No hay futuro.",
                  "TV: ...."}

function Tv.new(position)
  Tv.position = position
  Tv.i = 0
  return Tv
end

function Tv:interact()
  local i = 1
  return function () anuncio = anuncios[i]; i = i + 1; if(i > 3) then i = 1 end; return anuncio end
end

return Tv