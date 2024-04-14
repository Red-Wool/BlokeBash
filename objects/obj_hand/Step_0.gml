	if(point_distance(shoulderX,shoulderY,mouse_x,mouse_y) < reach)
	{
		x = shoulderX + (mouse_x- shoulderX);
		y = shoulderY + (mouse_y- shoulderY);
	}
	else
	{
	x = shoulderX + reach*((mouse_x- shoulderX)/ sqrt(sqr(mouse_x- shoulderX) + sqr(mouse_y- shoulderY)));
	y = shoulderY + reach*((mouse_y- shoulderY)/ sqrt(sqr(mouse_x- shoulderX) + sqr(mouse_y- shoulderY)));
	
	}
	


