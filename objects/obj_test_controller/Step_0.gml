/// @description Insert description here
// You can write your code in this editor

if gamepad_is_connected(0)
{
	//Get Left Stick Input
	var haxis = gamepad_axis_value(0, gp_axislh);
	var vaxis = gamepad_axis_value(0, gp_axislv);
	
	
	
	show_debug_message(haxis)
	
	x += haxis * 5
	y += vaxis * 5
	
	//Get Right Stick Input
	haxis = gamepad_axis_value(0, gp_axisrh);
	vaxis = gamepad_axis_value(0, gp_axisrv);
	
	hand.x = x + haxis*50
	hand.y = y + vaxis*50
	hand.image_angle = point_direction(0,0,haxis,vaxis)
}
else
{
	var haxis = (keyboard_check(vk_right) ? 1 : 0) - (keyboard_check(vk_left) ? 1 : 0)
	var vaxis = (keyboard_check(vk_down) ? 1 : 0) - (keyboard_check(vk_up) ? 1 : 0)
	
	x += haxis * 5
	y += vaxis * 5
	
	haxis = mouse_x - x + .0
	vaxis = mouse_y - y + .0
	
	var len = point_distance(0,0, haxis, vaxis)

	haxis /= len
	vaxis /= len
	
	hand.x = x + haxis*50
	hand.y = y + vaxis*50
	hand.image_angle = point_direction(0,0,haxis,vaxis)
}