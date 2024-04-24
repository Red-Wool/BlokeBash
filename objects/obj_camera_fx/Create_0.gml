global.camera_fx = self

shakeTimer = 0
shakeTime = 1
shakeStrength = 0

function screen_shake(timer, str) {
	shakeTime = timer;
	shakeTimer = timer;
	
	shakeStrength = str
}



function hit_stop(slow, wait) {
	show_debug_message("Slow it down")
	game_set_speed(slow, gamespeed_fps)
	alarm[0] = wait
}
