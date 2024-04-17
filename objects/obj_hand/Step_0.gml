	if gamepad_is_connected(0)
{
	//Get Left Stick Input
	var haxis = gamepad_axis_value(0, gp_axisrh);
	var vaxis = gamepad_axis_value(0, gp_axisrv);
	
	x = shoulderX + haxis * reach
	y = shoulderY + vaxis * reach
}
else
{
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
}
	
	
	


