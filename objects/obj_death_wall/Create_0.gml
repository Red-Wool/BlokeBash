/// @description Insert description here
// You can write your code in this editor

canHit = true

minVelocityHurt = .001
damageScale = 10000
stunScale = 200
velocityScale = 2200

function checkScreenCrash()
{
	return (side_x != 0 and abs(global.screen_manager.screen_velocity_x) > minVelocityHurt and sign(side_x) == -sign(global.screen_manager.screen_velocity_x)) or
	(side_y != 0 and sign(side_y) == -sign(global.screen_manager.screen_velocity_y))

}

function applyScreenCrash(player)
{
	audio_stop_sound(ScreenCrash)
	audio_play_sound(ScreenCrash, 0, 0, 1, 0)
	
	if (side_x != 0)
	{
		player.playerHurt((round(abs(global.screen_manager.screen_velocity_x)*damageScale)+minVelocityHurt),
		10 + round(abs(global.screen_manager.screen_velocity_x)*stunScale))
				
		var xForce = -side_x * round(abs(global.screen_manager.screen_velocity_x) * velocityScale)
				
		var dir = point_direction(0, 0 , xForce, -side_y - abs(xForce) * .5)
		player.grounded = 0
		
		player.y -= 3
		player.scaleHit(dir,round(abs(global.screen_manager.screen_velocity_x) * velocityScale))
	}
	if (side_y != 0)
	{
		player.playerHurt((round(abs(global.screen_manager.screen_velocity_y)*damageScale)+minVelocityHurt),
		10 + round(abs(global.screen_manager.screen_velocity_y)*stunScale))
				
		var yForce = -side_y * round(abs(global.screen_manager.screen_velocity_y) * velocityScale)
				
		var dir = point_direction(0, 0 , 0, -side_y)
		player.grounded = 0
		
		player.y -= 3

		var xOri = player.speed*cos(degtorad(player.direction));
		var yOri = -player.speed*sin(degtorad(player.direction));
		
		show_debug_message(string(yOri) + " checking y vel")
		yOri = round(abs(global.screen_manager.screen_velocity_y) * velocityScale * 2 * side_y)
		show_debug_message(string(yOri) + " checking y vel")
		
		player.direction = point_direction(0,0,xOri, -yOri)
		player.speed = point_distance(0,0,xOri,yOri)
		
	}
}

function applyScreenSmash(playerSpeed, playerDirection)
{
	playerX = lengthdir_x(playerSpeed, playerDirection)
	playerY = lengthdir_y(playerSpeed, playerDirection)
	
	//show_debug_message(string(playerX) + " " + string(playerY) + " scrs")

	if (abs(playerX * side_x) + abs(playerY * side_y) > 5)
	{
		
		
		
		global.camera_fx.screen_shake(10,5)
		global.camera_fx.hit_stop(15, 2)
		
		global.screen_manager.hit_wall(side_x * .0003 * abs(playerX), side_y * .0003 * abs(playerY))	
	}
	
	
}