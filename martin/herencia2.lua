-- ANIMAL --
Animal = {}

function Animal.new(self)
  animal = {}
  setmetatable(animal, self)
  self.__index = self
  return animal
end
---[[
function Animal.hablar(self)
  print("No se")
end
--]]

-- PERRO --
Perro = Animal:new()

function Perro.hablar(self)
  print("Guau")
end

p = Perro:new()
p:hablar()

-- GATO --
Gato = Animal:new()

function Gato.hablar(self)
  print("Miau")
end

g = Gato:new()
g:hablar()
