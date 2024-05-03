/// @description Insert description here
// You can write your code in this editordddddddd
if(playerOwner.sprite_index == playerOwner.hitSprite)
{ 
	return;
}



var s = hit ? 1.5: 1

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

shader_set_uniform_f(detectRange, .01 + max(swishTimer/20,0) * (.04+auraPower*.1))
shader_set_uniform_f(aura, playerOwner.super*.4 + auraPower)
shader_set_uniform_f(shaderTime, shaderTimer)

shader_set_uniform_f(swish, swishX * max(swishTimer/20,0) * 3., swishY * max(swishTimer/20,0) * 3.)

draw_sprite_ext(sprite_index, image_index, x,y, s, s, image_angle, c_white, 1)
shader_reset()


