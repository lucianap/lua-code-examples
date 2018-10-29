require 'map-functions'
local SpriteSheet = require 'SpriteSheet'
local Tv = require 'Objects.Tv'

local ANIMATION_UP = 1
local ANIMATION_LEFT = 2
local ANIMATION_DOWN = 3
local ANIMATION_RIGHT = 4

local STEP = 1

function love.load()
  loadMap('maps/map3.lua')
  currentAnimation = loadCharacterSpriteSheet()
  position = {x = 1 * framewidth, y = 1 * framewidth}
  
  teve = Tv.new({x=32, y=7})

end

function love.draw()
	drawMap()
	drawCharacter(currentAnimation, position)
	teve:draw()
end

function love.update(dt)
	
	newPosition = position
	local isDown=love.keyboard.isDown
	if isDown('right') or isDown('d') then
	  	currentAnimation = ANIMATION_RIGHT
	  	newPosition = {x = position.x+STEP, y = position.y}
	  	for k,v in ipairs(Animations) do v:update(dt) end
	elseif isDown('left') or isDown('a') then
	 	currentAnimation = ANIMATION_LEFT
	  	newPosition = { x = position.x-STEP, y = position.y}
	  	for k,v in ipairs(Animations) do v:update(dt) end
	elseif isDown('up') or isDown('w') then
	  	currentAnimation = ANIMATION_UP
	  	newPosition = {x = position.x, y = position.y-STEP}
	  	for k,v in ipairs(Animations) do v:update(dt) end
	elseif isDown('down') or isDown('s') then
		newPosition = {x = position.x, y = position.y+STEP}
	  	currentAnimation = ANIMATION_DOWN
	  	for k,v in ipairs(Animations) do v:update(dt) end
	end

	print(getTile(newPosition))
	print("x: ".. position.x.." y: ".. position.y)

	position = newPosition 

  	
end

MainCharacter = {}

function drawCharacter(currentAnimation, position)	
	Animations[currentAnimation]:draw(position.x, position.y)
	Animations[currentAnimation]:play() 	
end

function loadCharacterSpriteSheet() 
	local img='skeleton-spritesheet.png'
	framewidth=64
  	frameheight=64
  	S=SpriteSheet.new(img, framewidth, frameheight)
  	Animations={}
  	for row=1,4 do
  	  local a=S:createAnimation()
  	  for col=1,9 do
  	    a:addFrame(col, row)
  	  end
  	  Animations[#Animations+1]=a
  	end
  	
  Animations[#Animations+1]=a
  return ANIMATION_DOWN
end

