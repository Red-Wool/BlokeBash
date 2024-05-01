var mag = point_distance(currentX, currentY, targetX, targetY)


if(active)
{
	active -= 1;
	if(!active)
	{
	if(hit)
	{
		hit = 0;
		cooldown = 9;
	}
	else if(heavyHit)
	{
		heavyHit = 0;
		cooldown = 25
	}
	}
}

if(cooldown)
{
	cooldown -= 1;
	currentFistSpeed = 0;
	if(!cooldown)
		currentFistSpeed = 25;
	return;
}





if ((s*prevX < s*currentX) && point_distance(shoulderX,shoulderY,x,y) > 75) || ((s*prevX > s*currentX) && point_distance(shoulderX,shoulderY,x,y) > 75)

{
shaderTimer += hit ? 3 : 1
	if(!hit && mag > 3 && dipper)
	{
	//&& prevX < currentX
		sprite_index = spr_JoshFireHand
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

hhTrigger = 0;

if(gamepad_is_connected(playerNum))
{
	if gamepad_button_check(playerNum,gp_shoulderrb)
		hhTrigger = 1;
}
else if(mouse_check_button(mb_right))
{
	hhTrigger = 1;
}

if(hit && hhTrigger)
{
	hit = 0;
	heavyHit = 1;
	currentFistSpeed = 100;
			if !playerOwner.grounded
			{
				playerOwner.addVector(point_direction(0,0, targetX-currentX, -abs(targetY-currentY)-20), mag * 1.15 *punchVelocityAirScale)
			}
			else
			{
				playerOwner.addVector(point_direction(0,0, targetX-currentX, 0), mag * 1.5 * punchVelocityGroundScale)
			}
}


if(mag < 3 && dipper)
{
	dipper = 0;
	if(hit)
	active = 5;
	else if(heavyHit)
	active = 7;
	
} 

if(point_distance(shoulderX,shoulderY,x,y) <= 75)
{	
	active = 0;
	hit = 0;
	heavyHit = 0;
	dipper = 1;
	sprite_index = spr_JoshHand
}



if(hit || heavyHit)
{
		o = instance_place(x,y,obj_player)
		h = instance_place(x,y,obj_hand)
		if(instance_exists(o) && o != playerOwner)
		{
			if(hit)
			{
			global.camera_fx.hit_stop(8, 1)
			o.addVector(90 + (-s*30),30)
			hit = 0;
			o.playerHurt(150,25)
			cooldown = 5;
			}
			else if(heavyHit)
			{
				global.camera_fx.hit_stop(13, 2)
				o.addVector(90 + (-s*45),70)
				heavyHit = 0;
				o.playerHurt(400,25)
				cooldown = 15;
			}
			dipper = 0;
			active = 0;
		}
		else if(instance_exists(h) && h != id)
		{
			cooldown = 20;
			dipper = 0;
			active = 0;
			hit = 0;
			heavyHit = 0;
			h.cooldown = 18;
			h.dipper = 0;
			h.active = 0;
			h.hit = 0;
			h.heavyHit = 0;
			playerOwner.addVector(90 + (s*30),50)
			playerOwner.grounded = 0;
			h.playerOwner.addVector(90 - (s*30),50)
			h.playerOwner.grounded = 0;
		}
		
	
}






