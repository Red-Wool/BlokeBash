/// @description Insert description here
// You can write your code in this editor

set_window_pos()

x = center_x + screen_pos_x * window_scale// (sin(test_timer * .01) * 500.)// - screen_pos_x
y = center_y + screen_pos_y * window_scale// - screen_pos_y

show_debug_message(string(x) + " " + string(y))

/*
if keyboard_check_pressed(vk_down)
{
	center_y += 100
}
*/

