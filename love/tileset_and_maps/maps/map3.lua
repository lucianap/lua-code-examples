local tileString = [[
NNNN
NNNN
aGaN
]]

local quadInfo = { 
  { 'N',  0,  0 }, -- gray floor
  { 'G',  0, 96 }, -- brick wall
  { 'a', 32,  0 }, -- castle top
  { 'b', 32, 32 }, -- castle top 2
  { 'c', 64,  0 }, -- castle bottom 1
  { 'd', 64, 32 }, -- castle bottom 2
}

newMap(15,15,'/images/lu-tiles.png', tileString, quadInfo)
