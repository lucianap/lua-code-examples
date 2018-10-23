require 'map-functions'

function love.load()
  loadMap('maps/map3.lua')
end

function love.draw()
  drawMap()
end