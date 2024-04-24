/// @description Insert description here
// You can write your code in this editor

if grounded
{
	s = global.game_manager.player_facing(playerNum)
}

gpu_set_fog(true, c_black, 0, 1000)
draw_sprite_ext(sprite_index, image_index,x,y + sprite_height*.2,s,.8,image_angle,c_black, .6)
gpu_set_fog(false, c_black, 0, 1000)
image_xscale = s
draw_sprite_ext(sprite_index, image_index,x,y,s,1,image_angle,hitStun > 0 ? c_red : c_white, .6)



