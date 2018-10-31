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
  position = {x = 0 * framewidth, y = 0 * framewidth}
  
  teve = Tv.new({x=4*32, y=7*32})

  message = "LUA GAME"

end

function love.draw()
	drawMap()
	drawCharacter(currentAnimation, position)
	teve:draw()
	font = love.graphics.newFont(50) 
	love.graphics.setFont(font)
	love.graphics.print(message, 10, 400)
end

function love.update(dt)
	
	newPosition = position
	local isDown=love.keyboard.isDown
	if isDown('right') then
	  	currentAnimation = ANIMATION_RIGHT
	  	newPosition = {x = position.x + STEP, y = position.y}
	  	message = ""
	  	for k,v in ipairs(Animations) do v:update(dt) end
	elseif isDown('left') then
	 	currentAnimation = ANIMATION_LEFT
	  	newPosition = { x = position.x - STEP, y = position.y}
	  	message = ""
	  	for k,v in ipairs(Animations) do v:update(dt) end
	elseif isDown('up') then
	  	currentAnimation = ANIMATION_UP
	  	newPosition = {x = position.x, y = position.y - STEP}
	  	message = ""
	  	for k,v in ipairs(Animations) do v:update(dt) end
	elseif isDown('down') then
		newPosition = {x = position.x, y = position.y + STEP}
	  	currentAnimation = ANIMATION_DOWN
	  	message = ""
	  	for k,v in ipairs(Animations) do v:update(dt) end
	end

	if isDown('s') then
		print(getTile(newPosition))
		print("POSITION x: ".. math.floor(position.x/32).." y: ".. math.floor(position.y/32))
		print("NEW POSITION x: ".. math.floor(newPosition.x/32).." y: ".. math.floor(newPosition.y/32))
		print("TV x: ".. math.floor(teve.position.x/32).." y: ".. math.floor(teve.position.y/32))
	end	

	
	position = newPosition 

  	-- collideWith(teve)
end



function collideWith(object)

	if(currentAnimation == ANIMATION_RIGHT) then
  		print("looking right")
  		if(math.floor(newPosition.x/32) + 2 == math.floor(object.position.x/32) and math.floor(newPosition.y/32) == math.floor(object.position.y/32)) then
			message = object:interact()
		end
	elseif(currentAnimation == ANIMATION_LEFT) then
		print("looking left")
		if(math.floor(newPosition.x/32) == math.floor(object.position.x/32) and math.floor(newPosition.y/32) == math.floor(object.position.y/32)) then
			message = object:interact()
		end
	elseif(currentAnimation == ANIMATION_UP) then
		print("looking up")
		if(math.floor(newPosition.x/32) + 1 == math.floor(object.position.x/32) and math.floor(newPosition.y/32) - 1 == math.floor(object.position.y/32)) then
			message = object:interact()
		end
	elseif(currentAnimation == ANIMATION_DOWN) then
		print("looking down")
		if(math.floor(newPosition.x/32) + 1 == math.floor(object.position.x/32) and math.floor(newPosition.y/32) + 1 == math.floor(object.position.y/32)) then
			message = object:interact()
		end
	end
end
function love.keypressed(key)
   if key == "return" then
   		collideWith(teve)
   end
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
  Animations[ANIMATION_DOWN]:draw(0,0)
  return ANIMATION_DOWN
end

