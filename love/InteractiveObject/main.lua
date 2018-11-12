local Tv = require "Tv"
local Tel = require "Phone"


function love.load()
	
	teve = Tv:new({x = 20, y = 1})
	message = "no message"

	-- Crea una clausura del objeto
	interaction = teve:interact()

	-- Funciones de love para setear el tamaño y comportamiento de la ventana
	love.window.setMode(2000, 1000, {resizable=true, vsync=false, minwidth=400, minheight=300})
end

function love.update(dt)
  
end

function love.draw()
	love.graphics.scale(7, 7)   -- aumenta la escala de dibujo en 7%
	teve:draw() 
	love.graphics.print(message, 1, 80)
end

function love.keypressed(k)
  	if k=='q' or k=='escape' then
    	love.event.quit()
  	elseif k=='i' then
  		message = interaction()
  	end
end
