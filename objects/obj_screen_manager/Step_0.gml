/// @description Insert description here
// You can write your code in this editor

screen_x = screen_x + screen_velocity_x
if screen_x > 1 or screen_x < 0
{
	screen_velocity_x *= -velocity_display_edge_decay
	screen_x = clamp(screen_x, 0, 1)
}

screen_velocity_x *= velocity_decay


//test_timer += 1
//camera_set_view_pos(0, center_x, center_y + screen_pos_y)




//screen_x = sin(test_timer*.01)*.5+.5
//screen_y = cos(test_timer*.01)*.5+.5
