/// @description Insert description here
// You can write your code in this editor

if keyboard_check_pressed(vk_left)
{
	if !player_one_select
	{
		player_one_select_portrait.sprite_index = spr_temp_josh_portrait
		player_one_select_portrait.image_index = 0
		global.player_one_character = 0
		
		audio_play_sound(JoshGaming, 0, 0)
		
		player_one_select = true
	}
	else if !player_two_select
	{
		player_two_select_portrait.sprite_index = spr_temp_josh_portrait
		player_two_select_portrait.image_index = 0
		global.player_two_character = 0
		
		audio_play_sound(JoshGaming, 0, 0)
		
		player_two_select = true
	}
}
if keyboard_check_pressed(vk_right)
{
	if !player_one_select
	{
		player_one_select_portrait.sprite_index = spr_temp_josh_portrait
		player_one_select_portrait.image_index = 1
		global.player_one_character = 1
		
		audio_play_sound(KimariSelect, 0, 0, .5)
		
		player_one_select = true
	}
	else if !player_two_select
	{
		player_two_select_portrait.sprite_index = spr_temp_josh_portrait
		player_two_select_portrait.image_index = 1
		global.player_two_character = 1
		
		audio_play_sound(KimariSelect, 0, 0, .5)
		
		player_two_select = true
	}
}

if player_one_select and player_two_select and keyboard_check_pressed(vk_space)
{
	audio_stop_sound(SelectYourFighter)
	room_goto(GameScene)
}