require 'map-functions'
local SpriteSheet = require 'SpriteSheet'
local Tv = require 'Objects.Tv'
local Tel = require 'Objects.Phone'

local ANIMATION_UP = 1
local ANIMATION_LEFT = 2
local ANIMATION_DOWN = 3
local ANIMATION_RIGHT = 4

local STEP = 1

-- TODO:
-- fix del bug por el cual el equeleto no se dibuja apenas arranca.
local FIRST = 0

function love.load()
  loadMap('maps/map3.lua')
  currentAnimation = loadCharacterSpriteSheet()
  position = {x = 1 * framewidth, y = 1 * framewidth}
  
  objects = {
  	teve = Tv.new({x=4*32, y=7*32}),
  	tel = Tel.new({x=2*32, y=0})
  }
  

  love.window.setMode(900, 600, {resizable=true})

  message = " { LUA GAME } "

end

function love.draw()
	love.graphics.scale(2, 2)   -- aumenta la escala de dibujo en 7%
	drawMap()
	
	drawCharacter(currentAnimation, position)

	if(FIRST == 0) then
		FIRST = 1
		currentAnimation = ANIMATION_RIGHT
		for k,v in ipairs(Animations) do 
			v:update(0.1) 
		end
	end

	for objectName, obj in pairs(objects) do
		obj:draw()
	end

	font = love.graphics.newFont(30) 
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

	-- position info
	if isDown('i') then
		print(getTile(newPosition))
		print("POSITION x: ".. math.floor(position.x/32).." y: ".. math.floor(position.y/32))
		print("NEW POSITION x: ".. math.floor(newPosition.x/32).." y: ".. math.floor(newPosition.y/32))
		print("TV x: ".. math.floor(teve.position.x/32).." y: ".. math.floor(teve.position.y/32))
	end	

	
	position = newPosition 



  	-- collideWith(teve)
end

function collideWithNormal(object)
	local obj = object
	if(currentAnimation == ANIMATION_RIGHT) then
  		if(math.floor(newPosition.x/32) == math.floor(obj.position.x/32) and math.floor(newPosition.y/32) == math.floor(obj.position.y/32)) then
			message = obj:interact()
		end
	elseif(currentAnimation == ANIMATION_LEFT) then
		if(math.floor(newPosition.x/32) == math.floor(obj.position.x/32) and math.floor(newPosition.y/32) == math.floor(obj.position.y/32)) then
			message = obj:interact()
		end
	elseif(currentAnimation == ANIMATION_UP) then
		if(math.floor(newPosition.x/32) == math.floor(obj.position.x/32) and math.floor(newPosition.y/32) - 2 == math.floor(obj.position.y/32)) then
			message = obj:interact()
		end
	elseif(currentAnimation == ANIMATION_DOWN) then
		if(math.floor(newPosition.x/32) == math.floor(obj.position.x/32) and math.floor(newPosition.y/32) + 2 == math.floor(obj.position.y/32)) then
			message = obj:interact()
		end
	end
end

function collideWith(object)
	local obj = object
	if(currentAnimation == ANIMATION_RIGHT) then
  		if(math.floor(newPosition.x/32) + 2 == math.floor(obj.position.x/32) and math.floor(newPosition.y/32) == math.floor(obj.position.y/32)) then
			message = obj:interact()
		end
	elseif(currentAnimation == ANIMATION_LEFT) then
		if(math.floor(newPosition.x/32) == math.floor(obj.position.x/32) and math.floor(newPosition.y/32) == math.floor(obj.position.y/32)) then
			message = obj:interact()
		end
	elseif(currentAnimation == ANIMATION_UP) then
		if(math.floor(newPosition.x/32) + 1 == math.floor(obj.position.x/32) and math.floor(newPosition.y/32) - 1 == math.floor(obj.position.y/32)) then
			message = obj:interact()
		end
	elseif(currentAnimation == ANIMATION_DOWN) then
		if(math.floor(newPosition.x/32) + 1 == math.floor(obj.position.x/32) and math.floor(newPosition.y/32) + 2 == math.floor(obj.position.y/32)) then
			message = obj:interact()
		end
	end
end

function love.keypressed(key)
   if key == "return" then
   		for objectName, obj in pairs(objects) do
			print(objectName)
			print(obj)
			collideWith(obj)
			collideWithNormal(obj)
		end
   	elseif key == "s" then
   		-- speed the guy up
   		STEP = 2
   	elseif key == "l" then
   		STEP = 1
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

