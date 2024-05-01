var mag = point_distance(currentX, currentY, targetX, targetY)

if ((s*prevX < s*currentX) && s*currentX > .3) || ((s*prevX > s*currentX) && s*currentX < -.3)
{
	if(!hit && mag > 10)
	{
	//&& prevX < currentX
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
else
{
	hit = 0;	
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
		o = instance_place(x,y,obj_dummy)
		if(instance_exists(o) && p)
		{
			global.camera_fx.hit_stop(8, 1)
			o.addVector(image_angle+90,10)
			p = 0;
		}
	
}






