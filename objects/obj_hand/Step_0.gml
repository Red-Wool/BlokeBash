var mag = point_distance(currentX, currentY, targetX, targetY)

shaderTimer += hit ? 3 : 1

if ((s*prevX < s*currentX) && s*currentX > .3) || ((s*prevX > s*currentX) && s*currentX < -.3)
{
	if(!hit && mag > 10 && dipper)
	{
	//&& prevX < currentX
		sprite_index = spr_guac
		hit = 1;
		currentFistSpeed = hitFistSpeed
		
		if mag > 1
		{
			if !playerOwner.grounded
			{
				playerOwner.addVector(point_direction(0,0, targetX-currentX, -abs(targetY-currentY)-20), mag * punchVelocityAirScale)
			}
			else
			{
				playerOwner.addVector(point_direction(0,0, targetX-currentX, 0), mag * punchVelocityGroundScale)
			}
		}
		
		audio_play_sound(HitWhiff, 10, 0, .8, 0, .7 + mag * .004)
	}
}
else if(point_distance(shoulderX,shoulderY,x,y) < 50)
{	
	dipper = 1;
	sprite_index = spr_JoshHand
}


if(keyboard_check_pressed(ord("K")) || mouse_check_button_pressed(mb_right))
{
	//&& prevX < currentX
	if(!hit)
	{
		p = 1;
		hit = attackFrames + cooldownFrames;
		
		currentFistSpeed = superFistSpeed
		
		var mag = point_distance(currentX, currentY, targetX, targetY)
		if mag > 1
		{
			if !playerOwner.grounded
			{
				playerOwner.addVector(point_direction(0,0, targetX-currentX, -abs(targetY-currentY)-20), mag * heavyPunchVelocityAirScale)
			}
			else
			{
				playerOwner.addVector(point_direction(0,0, targetX-currentX, 0), mag * heavyPunchVelocityGroundScale)
			}
		}
		
		audio_play_sound(HeavyPunch, 10, 0, .5, 0, 1 + mag * .001)
	}
}

if(hit)
{
		o = instance_place(x,y,obj_player)
		
		if(instance_exists(o) && o != playerOwner)
		{
			global.camera_fx.hit_stop(8, 1)
			o.addVector(0,10)
			hit = 0;
			o.playerHurt(3,30)
			dipper = 0;
		}
	
}






