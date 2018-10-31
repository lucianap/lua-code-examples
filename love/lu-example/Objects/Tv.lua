local SpriteIntObj = require "InteractiveObject"

local Tv={}
Tv.__index=Tv

function Tv.new(position)
	local img='more-tiles.png'
  	framewidth=32
  	frameheight=32
  	S=SpriteIntObj.new(img, framewidth, frameheight)
  	obj = S:createInteractiveObject()
  	obj:setQuad(11 * framewidth,3 * frameheight, 32, 64)
  	obj.position = position
  	obj.message = "Se anuncia tiempo nublado."
  	return obj
end

return Tv