/// @description Insert description here
// You can write your code in this editor

var rand = random_range(0,360)

shakeTimer--
x = global.screen_manager.x + (max(shakeTimer, 0)/shakeTime) * shakeStrength * lengthdir_x(1, rand)
y = global.screen_manager.y + (max(shakeTimer, 0)/shakeTime) * shakeStrength * lengthdir_y(1, rand)


