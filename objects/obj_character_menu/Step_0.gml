/// @description Insert description here
// You can write your code in this editor

if keyboard_check_pressed(vk_left)
{
	if !player_one_select
	{
		global.player_one_character = 0
		player_one_select = true
	}
	else if !player_two_select
	{
		global.player_two_character = 0
		player_two_select = true
	}
}
if keyboard_check_pressed(vk_right)
{
	if !player_one_select
	{
		global.player_one_character = 1
		player_one_select = true
	}
	else if !player_two_select
	{
		global.player_two_character = 1
		player_two_select = true
	}
}

if player_one_select and player_two_select and keyboard_check_pressed(vk_space)
	room_goto(GameScene)
