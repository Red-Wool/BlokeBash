/// @description Insert description here
// You can write your code in this editor

x = global.screen_manager.set_wall_position_x(side_x)
y = global.screen_manager.set_wall_position_y(side_y)


if instance_place(x, y, obj_test_controller) //Hitting Player
{
	
	var player = instance_place(x, y, obj_test_controller)
	player.x -= side_x * 50
	player.y -= side_y * 50
}
if instance_place(x, y, obj_test_arm) //Hitting Arm
{
	var arm = instance_place(x, y, obj_test_arm)
	global.screen_manager.hit_wall(side_x * .01, side_y * .01)
}


