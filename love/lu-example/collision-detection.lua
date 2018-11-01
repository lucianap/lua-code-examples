function collide(rect1, rect2)
	if (rect1.x < rect2.x + rect2.w and
	   rect1.x + rect1.w > rect2.x and
	   rect1.y < rect2.y + rect2.h and
	   rect1.h + rect1.y > rect2.y) then
	    return true
	end
	return false
end
