/// @description Insert description here
// You can write your code in this editor

owner = pointer_null
check = true

colorShade = shader_get_uniform(OutlineShader, "outlineColor")
secondShade = shader_get_uniform(OutlineShader, "secondaryColor")
swish = shader_get_uniform(OutlineShader, "swish")
swishTimer = 0
swishX = 0;
swishY = 0;
detectRange = shader_get_uniform(OutlineShader, "detectRange")
shaderTime = shader_get_uniform(OutlineShader, "time")
aura = shader_get_uniform(OutlineShader, "aura")
shaderTimer = 0

move = 1

alarm[0] = 2000
