
screen_x = .5
screen_y = .5

window_size_x_percent = .4
window_xy_ratio = display_get_height()/display_get_width()

window_size_x = display_get_width() * window_size_x_percent
window_size_y = window_size_x * window_xy_ratio

window_set_size(window_size_x, window_size_y)

function resize_window(x_percent)
{
	window_size_x_percent = x_percent
	window_xy_ratio = display_get_height()/display_get_width()

	window_size_x = display_get_width() * window_size_x_percent
	window_size_y = window_size_x * window_xy_ratio

	window_set_size(window_size_x, window_size_y)
}

function set_window_pos()
{
	screen_pos_x = screen_x * (display_get_width()-window_size_x)
	screen_pos_y = screen_y * (display_get_height()-window_size_y)
	
	window_set_position(screen_pos_x, screen_pos_y)
}

cutsceneTimer = 0
cutsceneSceneNum = 0

counter = 0