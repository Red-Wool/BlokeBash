/// @description Insert description here
// You can write your code in this editor

gpu_set_fog(true, c_black, 0, 1000)
draw_sprite_ext(sprite_index, image_index,x,y + sprite_height*.2,1,.8,image_angle,c_black, .6)
gpu_set_fog(false, c_black, 0, 1000)
draw_self()



