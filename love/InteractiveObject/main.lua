local Tv = require "Tv"

function love.load()
  teve = Tv.new({x = 8, y = 8})
end

function love.update(dt)
  
end

function love.draw()
  teve:draw(12*32,12*32) 
end

function love.keypressed(k)
  if k=='q' or k=='escape' then
    love.event.quit()
  end
end
