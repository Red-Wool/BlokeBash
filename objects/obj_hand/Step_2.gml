

if gamepad_is_connected(0)
{
	//Get Left Stick Input
	var haxis = gamepad_axis_value(0, gp_axisrh);
	var vaxis = gamepad_axis_value(0, gp_axisrv);
	
	targetX = haxis * reach
	targetY =  vaxis * reach
}
else
{
	if(cursorlock)
	{
	holdX =  global.screen_manager.window_size_x/2;
	holdY =  global.screen_manager.window_size_y/2;
	
	
		if(point_distance(holdX,holdY,window_mouse_get_x(),window_mouse_get_y())> reach + 1)
		{

			theta = degtorad(point_direction(holdX,holdY,window_mouse_get_x(),window_mouse_get_y()))
			window_mouse_set(holdX + reach*cos(theta),holdY - reach*sin(theta));
			targetX = reach*cos(theta)
			targetY = -reach*sin(theta)
		}
		else
		{
			targetX = window_mouse_get_x() - holdX
			targetY = window_mouse_get_y() - holdY
		}
		
	}

}
	if(keyboard_check_pressed(vk_space))
	{
		cursorlock = cursorlock ? 0 : 1;
		if(cursorlock)
			window_set_cursor(cr_none)
		else
			window_set_cursor(cr_default)
	}

	prevX = currentX;
	theta = degtorad(point_direction(currentX,currentY,targetX,targetY))
	currentX = moveTowards(currentX,targetX,fistSpeed * abs(cos(theta)));
	currentY = moveTowards(currentY,targetY,fistSpeed * abs(sin(theta)));
	
	x = shoulderX + currentX;
	y = shoulderY + currentY;

	image_angle = point_direction(shoulderX,shoulderY,shoulderX + targetX,shoulderY + targetY) - 90;

	








