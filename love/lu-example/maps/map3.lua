local tileString = [[
WWWWWWWWWWWWWWWWWWWWWWWWW
WGGGGGGGGGGGGGGGGGGGGGGGW
WGGGGGGGGGGGGGGGGGGGGGGGW
WGGGGGGGGGGGGGGGGGGGGGGGW
WFGGGGGGGFFFFFFFFFFGGGGGW
WWWWWWWWWWWWWWWWWWWWWWWWW
]]

local frameSize = 32
local quadInfo = { 
  { 'G',  0,  0 }, --  grass
  { 'F',  0,  32 }, -- flowers
  { 'W', 32,  32 }, -- wood
}

newMap(32,32,'/images/countryside.png', tileString, quadInfo)
