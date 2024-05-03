global.character_menu = self
global.player_one_character = 0
global.player_two_character = 0

audio_play_sound(SelectYourFighter, 0, 1)

player_one_select = false
player_two_select = false

player_one_select_portrait = instance_create_depth(400, 500, 10, obj_character_select)
player_one_select_portrait.sprite_index = spr_hand
player_one_select_portrait.image_xscale = 3;
player_one_select_portrait.image_yscale = 3;

player_two_select_portrait = instance_create_depth(800, 500, 10, obj_character_select)
player_two_select_portrait.sprite_index = spr_hand
player_two_select_portrait.image_xscale = 3;
player_two_select_portrait.image_yscale = 3;

