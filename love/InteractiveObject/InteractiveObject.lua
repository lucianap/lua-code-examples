local lg = love.graphics

local InteractiveObject = {}
InteractiveObject.__index = InteractiveObject

function InteractiveObject:new(imgPath, w, h, col, row) 
  if type(imgPath)=='string' then
    img=lg.newImage(imgPath)
  end
  imgWidth = img:getWidth()
  imgHeight = img:getHeight()
  local quad = getQuad(col, row, w, h, imgWidth, imgHeight)
  local t={img = img, 
            imgw = imgWidth, 
            imgh = imgHeight, 
            width = w, 
            height = h, 
            name=name, 
            position = {x = 0, y = 0},
            quad = quad
          }
           
  self.__index = self               
  return setmetatable(t, self)
end

function InteractiveObject:draw()
  local myQuad=self.quad
  if myQuad then
    lg.draw(self.img, myQuad, self.position.x, self.position.y)
  end
end

function getQuad(col, row, width, height, imgw, imgh)
  local quad=lg.newQuad((col-1), (row-1), width, height, imgw, imgh)
  return quad
end


return InteractiveObject
