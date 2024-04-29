
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
	if(keyboard_check_pressed(vk_control))
	{
		cursorlock = cursorlock ? 0 : 1;
		if(cursorlock)
			window_set_cursor(cr_none)
		else
			window_set_cursor(cr_default)
	}
	
	var currentSpeed = hit > cooldownFrames ? hitFistSpeed : fistSpeed
	
	prevX = currentX;
	theta = degtorad(point_direction(currentX,currentY,targetX,targetY))
	currentX = moveTowards(currentX,targetX,currentSpeed * abs(cos(theta)));
	currentY = moveTowards(currentY,targetY,currentSpeed * abs(sin(theta)));
	
	if(abs(targetX == 0) && abs(targetY == 0))
	{
		targetX = 1;
		targetY = 1;
	}
	
	x = shoulderX + currentX;
	y = shoulderY + currentY;
	shoulderHandDistance = point_distance(shoulderX,shoulderY,x,y);
	UpperArmObj.direction = point_direction(shoulderX,shoulderY,x,y)
	UpperArmObj.x = shoulderX
	UpperArmObj.y = shoulderY
	
	theta = ((sqr(shoulderHandDistance) + sqr(UpperArmLength) - sqr(LowerArmLength))/(2*shoulderHandDistance*UpperArmLength))
	if(abs(theta) < 1)
	{
		theta = radtodeg(arccos(theta))
	}
	else
	{
		theta = 90;
	}

	UpperArmObj.image_angle = UpperArmObj.direction - s*(theta);
	LowerArmObj.x = shoulderX + lengthdir_x(UpperArmLength,UpperArmObj.image_angle)
	LowerArmObj.y = shoulderY + lengthdir_y(UpperArmLength,UpperArmObj.image_angle)
	LowerArmObj.image_angle = point_direction(LowerArmObj.x,LowerArmObj.y,x,y)
	
	image_angle = 	LowerArmObj.image_angle
	
	image_yscale = s;
	LowerArmObj.image_yscale = s;
	UpperArmObj.image_yscale = s;







