global.screen_manager = self

center_x = 5000
center_y = 5000

screen_x = .5
screen_y = .5
screen_pos_x = 0;
screen_pos_y = 0;

test_timer = 0

window_size_x_percent = .4
window_xy_ratio = display_get_height()/display_get_width()

window_size_x = display_get_width() * window_size_x_percent
window_size_y = window_size_x * window_xy_ratio

window_scale = 2

camera_set_view_size(view_camera[0], window_size_x * window_scale, window_size_y * window_scale)
//show_debug_message(window_size_x)
//show_debug_message(window_size_y)

window_set_size(window_size_x, window_size_y)

screen_velocity_x = 0
screen_velocity_y = 0

velocity_decay = .97
velocity_gravity = .001
velocity_display_edge_decay = .2

function set_window_pos()
{
	screen_pos_x = screen_x * (display_get_width()-window_size_x)
	screen_pos_y = screen_y * (display_get_height()-window_size_y)
	
	window_set_position(screen_pos_x, screen_pos_y)
}

function hit_wall(_force_x, _force_y)
{
	screen_velocity_x += _force_x;
	screen_velocity_y += _force_y;
	
	//Make sure sign is correct direction
	screen_y += _force_y * .001
}

function set_wall_position_x(_mult)
{
	return center_x + (screen_pos_x + window_get_width()*.5 * _mult) * window_scale
}

function set_wall_position_y(_mult)
{
	return center_y + (screen_pos_y + window_get_height()*.5 * _mult) * window_scale
}

window_set_caption("Bloke Bash")
window_set_showborder(false)

