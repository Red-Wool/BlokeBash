/// @description Insert description here
// You can write your code in this editor

if gamepad_is_connected(0)
{
	//Get Left Stick Input
	var haxis = gamepad_axis_value(0, gp_axislh);
	var vaxis = gamepad_axis_value(0, gp_axislv);
	
	x += haxis * 5
	y += vaxis * 5
	
	//Get Right Stick Input
	haxis = gamepad_axis_value(0, gp_axisrh);
	vaxis = gamepad_axis_value(0, gp_axisrv);
	
	hand.x = x + haxis*50
	hand.y = y + vaxis*50
	hand.image_angle = point_direction(0,0,haxis,vaxis)
}

