local tileString = [[
==========
=bb=*****=
=bb=*****=
=rrrrrrrr=
=rrrrrrrr=
=rrrrrrrr=
==========
]]

local frameSize = 32
local quadInfo = { 
  { '*', frameSize    ,  0 }, --  grass
  { 'C', frameSize * 2,  0 }, -- flowers
  { 'r', frameSize * 3,  0 }, -- wood
  { 'b', frameSize * 3,  0 }, -- wood
  { '=', frameSize * 8,  0 }   -- wood
}

newMap(32,32,'/images/more-tiles.png', tileString, quadInfo)