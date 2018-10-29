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
  	return obj
end

function Tv:draw()
	obj:draw(position.x, position.y)
end

return Tv