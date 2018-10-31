local Tv = require "Tv"

function love.load()
  teve = Tv.new({x = 8, y = 8})
  message = "ii"
end

function love.update(dt)
  
end

function love.draw()
  teve:draw(1*32,1*32) 
  love.graphics.print(message, 10, 200)
end

function love.keypressed(k)
  if k=='q' or k=='escape' then
    love.event.quit()
  elseif k=='i' then
  	message = teve:interact()
  end
end
