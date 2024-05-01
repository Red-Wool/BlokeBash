/// @description Insert description here
// You can write your code in this editor

canHit = true

minVelocityHurt = .001
damageScale = 100000
stunScale = 200
velocityScale = 3000

function checkScreenCrash()
{
	return abs(global.screen_manager.screen_velocity_x) > minVelocityHurt and sign(side_x) == -sign(global.screen_manager.screen_velocity_x)

}

function applyScreenCrash(player)
{
	audio_stop_sound(ScreenCrash)
	audio_play_sound(ScreenCrash, 0, 0, 1, 0)
	
	player.playerHurt(round(abs(global.screen_manager.screen_velocity_x)*damageScale+minVelocityHurt),
	10 + round(abs(global.screen_manager.screen_velocity_x)*stunScale))
			
	var xForce = -side_x * round(abs(global.screen_manager.screen_velocity_x) * velocityScale)
			
	var dir = point_direction(0, 0 , xForce, -side_y - abs(xForce) * .5)
	player.grounded = 0
	
	//show_debug_message(dir)
	//show_debug_message(" direction")
	player.y -= 3
	player.addVector(dir,round(abs(global.screen_manager.screen_velocity_x) * velocityScale))
}

function applyScreenSmash(playerSpeed, playerDirection)
{
	playerX = lengthdir_x(playerSpeed, playerDirection)
	playerY = lengthdir_y(playerSpeed, playerDirection)
	
	show_debug_message(string(playerX) + " " + string(playerY) + " scrs")

	if (abs(playerX * side_x) + abs(playerY * side_y) > 5)
	{
		
		
		
		global.camera_fx.screen_shake(10,5)
		global.camera_fx.hit_stop(15, 2)
		
		global.screen_manager.hit_wall(side_x * .0003 * abs(playerX), side_y * .0003 * abs(playerY))	
	}
	
	
}