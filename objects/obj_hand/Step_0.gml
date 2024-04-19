if(keyboard_check_pressed(ord("A")) || mouse_check_button_pressed(mb_left))
{
	//&& prevX < currentX
	if(!hit)
	{
		p = 1;
		sprite_index = spr_hand_active
		hit = attackFrames + cooldownFrames;
		
		var mag = point_distance(currentX, currentY, targetX, targetY)
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
	}
}

if(hit)
{
	hit -= 1;
	
	if(hit <= cooldownFrames)
	{
		sprite_index = spr_hand_end;
	}
	else
	{
		o = instance_place(x,y,obj_dummy)
		if(instance_exists(o) && p)
		{
			global.camera_fx.hit_stop(8, 1)
			o.addVector(image_angle+90,10)
			p = 0;
		}
		
		
	}
	
	if(!hit)
	{
		sprite_index = spr_hand
	}
}






