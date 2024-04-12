global.screen_manager = self

screen_x = .5
screen_y = .5

test_timer = 0

window_size_x_percent = .3
window_xy_ratio = 1

window_size_x = display_get_width() * window_size_x_percent
window_size_y = window_size_x * window_xy_ratio

window_set_size(window_size_x, window_size_y)
//window_size_y = .4;

screen_velocity_x = 0
screen_velocity_y = 0

velocity_decay = .1;

function set_window_pos()
{
	window_set_position(
	screen_x* (display_get_width()-window_size_x), 
	screen_y * (display_get_height()-window_size_y))
}

function hit_wall(_force)
{
	screen_velocity_x += _force;
}