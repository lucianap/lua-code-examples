local lg=love.graphics

local InteractiveObject={}
InteractiveObject.__index=InteractiveObject

function InteractiveObject.new(spritesheet)
  local obj={parent=spritesheet, name=name, position = {x = 1, y = 1}, message = ""}
  return setmetatable(obj, InteractiveObject)
end

function InteractiveObject:draw(x, y)
  local quad=self.quad
  if quad then
    lg.draw(self.parent.img, quad, self.position.x, self.position.y)
  end
end

function InteractiveObject:setQuad(col, row, w, h)
  local parent=self.parent
  local quad=lg.newQuad((col-1), (row-1), w, h, parent.imgw, parent.imgh)
  self.quad=quad
  return self
end

function InteractiveObject:interact()
  print("mess: "..self.message)
  return self.message
end

local SpriteSheet={}
SpriteSheet.__index=SpriteSheet

function SpriteSheet.new(img, w, h)
  if type(img)=='string' then
    img=lg.newImage(img)
  end
  local obj={img=img, w=w, h=h, InteractiveObj={}}
  obj.imgw=img:getWidth()
  obj.imgh=img:getHeight()
  return setmetatable(obj, SpriteSheet)
end

function SpriteSheet:createInteractiveObject(...)
  local a=InteractiveObject.new(self)
  return a
end

return SpriteSheet
