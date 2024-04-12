/// @description Insert description here
// You can write your code in this editor

if keyboard_check_pressed(vk_left)
{
	global.screen_manager.hit_wall(-.01)
}

if keyboard_check_pressed(vk_right)
{
	global.screen_manager.hit_wall(.01)
}
