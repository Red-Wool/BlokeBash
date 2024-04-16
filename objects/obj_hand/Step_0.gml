if(keyboard_check_pressed(ord("A")))
{
	if(!hit && prevX < currentX)
	{
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
	
	if(!hit)
	{
		sprite_index = spr_hand
	}
}






