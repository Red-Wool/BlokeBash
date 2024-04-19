/// @description Insert description here
// You can write your code in this editor

minVelocityHurt = .001
damageScale = 100000
stunScale = 100
velocityScale = 1000

function checkScreenCrash()
{
	return abs(global.screen_manager.screen_velocity_x) > minVelocityHurt and sign(side_x) == -sign(global.screen_manager.screen_velocity_x)

}

function applyScreenCrash(player)
{
	player.playerHurt(round(abs(global.screen_manager.screen_velocity_x)*damageScale+minVelocityHurt),
	10 + round(abs(global.screen_manager.screen_velocity_x)*stunScale))
			
	var xForce = -side_x * round(abs(global.screen_manager.screen_velocity_x) * velocityScale)
			
	var dir = point_direction(0, 0 , xForce, -side_y - abs(xForce) * .5)
	player.grounded = 0
	
	//show_debug_message(dir)
	show_debug_message(" direction")
	player.y -= 3
	player.addVector(dir,round(abs(global.screen_manager.screen_velocity_x) * velocityScale))
}