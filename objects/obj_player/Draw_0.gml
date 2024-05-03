/// @description Insert description here
// You can write your code in this editor

if grounded
{
	s = global.game_manager.player_facing(playerNum)
	handObj.s = s;
}

if(hitStun && sprite_index != hitSprite && sprite_index != deathSprite)
	sprite_index = hitSprite

if(d)
	sprite_index = deathSprite
	
if(hasGodWalker)
{
	if(d)
		sprite_index = deathSprite
	else if(hitStun)
		sprite_index = spr_unHit;
	else if(m)
		sprite_index = spr_unWalk;
	else
		sprite_index = spr_unJacket
}

gpu_set_fog(true, c_black, 0, 1000)
draw_sprite_ext(sprite_index, image_index,x,y + sprite_height*.2,s,.8,image_angle,c_black, .6)
gpu_set_fog(false, c_black, 0, 1000)
image_xscale = s

shader_set(OutlineShader)

if playerNum == 0
{
	shader_set_uniform_f(colorShade, 1, 0, 0, 1)
	shader_set_uniform_f(secondShade, 1, .67, 0, 1)
}
else
{
	shader_set_uniform_f(colorShade, 1, 0, 1, 1)
	shader_set_uniform_f(secondShade, .5, 0, 1, 1)
}
	
shader_set_uniform_f(detectRange, .005 + super * .005 + (hasGodWalker ? .05 : 0))
shader_set_uniform_f(shaderTime, shaderTimer)
shader_set_uniform_f(swish, swishX * max(swishTimer/10,0) * .3 + (hasGodWalker ? .01: 0), swishY * max(swishTimer/10,0) * .3  + (hasGodWalker ? .01: 0))
shader_set_uniform_f(aura, super + (hasGodWalker ? 1.: 0))

draw_sprite_ext(sprite_index, image_index,x,y,s,1,image_angle,hitStun > 0 ? c_red : c_white, 1)

shader_reset()



