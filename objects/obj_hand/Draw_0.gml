/// @description Insert description here
// You can write your code in this editor

var s = hit ? 1.5: 1

shader_set(OutlineShader)

show_debug_message(string(playerOwner) + " aaa")

if playerOwner.playerNum == 0
	shader_set_uniform_f(colorShade, 1, 0, 0, 1)
else
	shader_set_uniform_f(colorShade, 1, 0, 1, 1)


shader_set_uniform_f(detectRange, .05 + playerOwner.super * .05)
shader_set_uniform_f(aura, playerOwner.super)
shader_set_uniform_f(shaderTime, shaderTimer)

draw_sprite_ext(sprite_index, image_index, x,y, s, s, image_angle, c_white, 1)
shader_reset()


