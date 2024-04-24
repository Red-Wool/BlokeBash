x = global.screen_manager.x
y = global.screen_manager.y

if is_playing
{
	game_time -= 1./game_get_speed(gamespeed_fps)
}

if can_leave and keyboard_check_pressed(vk_space)
{
	room_goto(SelectMenu)
}
//show_debug_message(game_time)
//show_debug_message(game_get_speed(gamespeed_fps))