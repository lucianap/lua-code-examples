require 'map-functions'

function love.load()
  loadMap('maps/map1.lua')
end

function love.draw()
  drawMap()
end

function love.keypressed(key)
   if key == "0" then
 	loadMap('maps/map3.lua')
   elseif key == "1" then
   	loadMap('maps/map2.lua')
   elseif key == "2" then
   	loadMap('maps/map3.lua')
   elseif key == "3" then
   	loadMap('maps/map4.lua')
   elseif key == "4" then
   	loadMap('maps/map5.lua')
   end
end

