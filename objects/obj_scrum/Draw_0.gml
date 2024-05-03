/// @description Insert description here
// You can write your code in this editor

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
	
shader_set_uniform_f(detectRange, .005 + super * .005)
shader_set_uniform_f(shaderTime, shaderTimer)
shader_set_uniform_f(swish, swishX * max(swishTimer/10,0) * .3, swishY * max(swishTimer/10,0) * .3)
shader_set_uniform_f(aura, super)


draw_self()

shader_reset()


