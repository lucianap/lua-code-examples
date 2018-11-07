require 'map-functions'
require 'collision-detection'
local SpriteSheet = require 'SpriteSheet'
local Tv = require 'Objects.Tv'
local Tel = require 'Objects.Phone'
local Leandro = require 'Objects.Leandro'
local Switch = require 'Objects.Switch'

local ANIMATION_UP = 1
local ANIMATION_LEFT = 2
local ANIMATION_DOWN = 3
local ANIMATION_RIGHT = 4

local STEP = 1

-- TODO:
-- fix del bug por el cual el equeleto no se dibuja apenas arranca.
local FIRST_FRAME = 0

Escenario = {
	mapa = 'maps/map3.lua',
	objetos = {
  		teve = Tv.new({x=4*32, y=7*32}),
  		tel = Tel.new({x=2*32, y=0}),
  		leandro = Leandro.new({x=7*32,y=2*32}),
  		switch = Switch.new({x=5*32, y=0})
  	}
}

function love.load()

	loadMap(Escenario.mapa)
	currentAnimation = loadCharacterSpriteSheet()
	position = {x = 1 * framewidth, y = 1 * framewidth}
	characterDimensions = {h = 64, w = 64}
	love.window.setMode(900, 600, {resizable=true})

	message = " { LUA GAME } "

end

function love.draw()
	love.graphics.scale(2, 2)   -- aumenta la escala de dibujo en 2%
	drawMap()
	
	drawCharacter(currentAnimation, position)

	-- FIXME 
	if(FIRST_FRAME == 0) then
		FIRST_FRAME = 1
		currentAnimation = ANIMATION_RIGHT
		for k,v in ipairs(Animations) do 
			v:update(0.1) 
		end
	end

	for objectName, obj in pairs(Escenario.objetos) do
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

end

function isCollidingWithAnyObject(allObjects)
	for objectName, obj in pairs(allObjects) do
   			if(isColliding(obj)) then
   				return true
   			end
		end
	return false
end

function isColliding(object)
	if object then
		characterRectangle = {x = position.x, y = position.y, w = characterDimensions.w, h = characterDimensions.h}
		objectRectangle = {x = object.position.x, y = object.position.y, w = object.width, h = object.height}
		return collide(characterRectangle, objectRectangle)
	end
	return false
end
	

function love.keypressed(key)
   if key == "return" then
   		for objectName, obj in pairs(Escenario.objetos) do
   			if(isColliding(obj)) then
   				message = obj:interact()
   			end
		end
   	elseif key == "s" then
   		-- speed the guy up
   		STEP = 2
   	elseif key == "l" then
   		STEP = 1
   end
end

Protagonist = {}
Protagonist.__index = Protagonist

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

