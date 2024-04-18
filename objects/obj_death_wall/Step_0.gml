/// @description Insert description here
// You can write your code in this editor

x = global.screen_manager.set_wall_position_x(side_x)
y = global.screen_manager.set_wall_position_y(side_y)


if instance_place(x, y, obj_player) //Hitting Player
{
	
	var player = instance_place(x, y, obj_player)
	
	//Screen Crash
	if abs(global.screen_manager.screen_velocity_x) > minVelocityHurt and sign(side_x) == -sign(global.screen_manager.screen_velocity_x)
	{
		//player.x -= side_x * 50
		//player.y -= side_y * 50
		
		player.playerHurt(round(abs(global.screen_manager.screen_velocity_x)*damageScale+minVelocityHurt),
		10 + round(abs(global.screen_manager.screen_velocity_x)*stunScale))
		
		
		var dir = point_direction(0, 0 , -side_x, -side_y)
		show_debug_message(dir)
		show_debug_message(" direction")
		player.addVector(dir,round(abs(global.screen_manager.screen_velocity_x) * velocityScale))
	}
	else //No Screen Crash
	{
		
	}
	
	
}
if instance_place(x, y, obj_hand) //Hitting Arm
{
	
	var arm = instance_place(x, y, obj_hand)
	if arm.isHitting()
	{
		global.screen_manager.hit_wall(side_x * .01, side_y * .01)
	}

}


