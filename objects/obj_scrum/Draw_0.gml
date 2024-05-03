/// @description Insert description here
// You can write your code in this editor

shader_set(OutlineShader)

shader_set_uniform_f(colorShade, .5, 0, 1, 1)
shader_set_uniform_f(secondShade, .2, 0, .8, 1)
	
shader_set_uniform_f(detectRange, .1)
shader_set_uniform_f(shaderTime, shaderTimer)
shader_set_uniform_f(swish, swishX * max(swishTimer/10,0) * .3, swishY * max(swishTimer/10,0) * .3)
shader_set_uniform_f(aura, 1)


draw_self()

shader_reset()


