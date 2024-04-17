if(!grounded)
{
	if(place_meeting(x,y,obj_floor))
	{
		grounded = 1;
		stopYVelocity()
	}
	else if(direction < 180)
		addVector(270,upGravity)
	else
		addVector(270,downGravity)
}



if gamepad_is_connected(0)
{
	//Get Left Stick Input
	var haxis = gamepad_axis_value(0, gp_axislh);
	var vaxis = -gamepad_axis_value(0, gp_axislv);
	

	/*
	//Get Right Stick Input
	haxis = gamepad_axis_value(0, gp_axisrh);
	vaxis = gamepad_axis_value(0, gp_axisrv);
	
	hand.x = x + haxis*50
	hande.y = y + vaxis*50
	hand.image_angle = point_direction(0,0,haxis,vaxis)
	*/
}
else
{
	var haxis = (keyboard_check(vk_right) ? 1 : 0) - (keyboard_check(vk_left) ? 1 : 0)
	var vaxis = (keyboard_check(vk_up) ? 1 : 0) - (keyboard_check(vk_down) ? 1 : 0)

}

x += haxis * moveSpeed
	
if(vaxis > .5 && grounded)
{
		addVector(90,14)
		grounded = 0;
}

handObj.shoulderX = x;
handObj.shoulderY = y;