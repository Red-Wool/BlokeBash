if(keyboard_check_pressed(ord("A")))
{
	//&& prevX < currentX
	if(!hit)
	{
		p = 1;
		sprite_index = spr_hand_active
		hit = attackFrames + cooldownFrames;
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
			o.addVector(image_angle+90,10)
			p = 0;
		}
		
		
	}
	
	if(!hit)
	{
		sprite_index = spr_hand
	}
}






