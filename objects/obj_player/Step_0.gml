if gamepad_is_connected(0)
{
	//Get Left Stick Input
	var haxis = gamepad_axis_value(0, gp_axislh);
	var vaxis = -gamepad_axis_value(0, gp_axislv);
	

	/*
	//Get Right Stick Input
	haxis = gamepad_axis_value(0, gp_axisrh);
	vaxis = gamepad_axis_value(0, gp_axisrv);
	
	hand.x = x + haxis*50
	hande.y = y + vaxis*50
	hand.image_angle = point_direction(0,0,haxis,vaxis)
	*/
}
else
{
	var haxis = (keyboard_check(ord("D")) ? 1 : 0) - (keyboard_check(ord("A")) ? 1 : 0)
	var vaxis = (keyboard_check(ord("W")) ? 1 : 0) - (keyboard_check(ord("S")) ? 1 : 0)

}

moveBurstTimer--
//MoveBursts
if keyboard_check_pressed(vk_space) and moveBursts >= 1
{
	moveBursts -= 1
	
	moveBurstTimer = grounded ? moveBurstGroundTime : moveBurstAirTime
	
	if grounded
		addVector(haxis >= 0 ? 0 : 180, moveBurstGroundForce)
	else
	{
		
		xOri = speed*cos(degtorad(direction));
		yOri = -speed*sin(degtorad(direction));
		if abs(yOri) > 1
		{
			yOri *= .1
			
			direction = point_direction(0,0,xOri, yOri)
			speed = sqrt(sqr(yOri) + sqr(xOri))
		}
		
		
		addVector(point_direction(0,0,haxis,-vaxis), moveBurstAirForce)
		
	}
}

if !global.game_manager.is_playing
{
	haxis = 0
	vaxis = 0
}

if hitStun > 0
{
	addVector(haxis > 0 ? 0 : 180, abs(haxis)*.2)
	addVector(vaxis > 0 ? 90 : 270, abs(vaxis)*.2)
	
	haxis = 0	
	vaxis = 0	
	
	grounded = false
}

hitStun--

if(!grounded)
{
	if(place_meeting(x,y,obj_floor))
	{
		sprite_index = landingSprite;
		grounded = 1;
		
		stopYVelocity()
	}
	else if(direction < 180)
		addVector(270,upGravity)
	else
		addVector(270,downGravity)
	
	
	xOri = speed*cos(degtorad(direction));
	if -sign(haxis) = sign(xOri)
	{
		yOri = -speed*sin(degtorad(direction));
		if abs(xOri) > 1
		{
			//XOri = -speed*sin(degtorad(direction));
		
			xOri *= airDecay
			
			show_debug_message(xOri)
			
			direction = point_direction(0,0,xOri, yOri)
			speed = sqrt(sqr(yOri) + sqr(xOri))
		}
	}
	
}
else 
{
	speed *= (moveBurstTimer > 0 ? groundDashFriction : groundFriction)
	if abs(haxis) > .1 and moveBurstTimer <= 0
	{
		speed *= moveFriction	
	}
	
	for (var i = 0; i < 10; i++)
	{
		if(place_meeting(x,y,obj_floor))
		{
			y -= 1	
		}
		else
		{
			break
		}
	}
}

if(place_meeting(x,y,obj_death_wall))
{
	touchWall(instance_place(x,y,obj_death_wall))	
}

if(sprite_index != jumpingSprite && sprite_index != landingSprite)
{
	if(grounded)
	{
		if(haxis*sign(image_xscale) > .05)
			sprite_index = walkSprite
		else if(haxis*sign(image_xscale) < -.05)
		{
			sprite_index = backWalkSprite
		}
		else
			sprite_index = idleSprite
	}
	
}

//show_debug_message(string(xOri) + " " + string(xNew))
  //show_debug_message(string(yOri) + " " + string(yNew))
  //show_debug_message(direction)

x += haxis * moveSpeed



if (grounded)
{
	addVector(haxis > 0 ? 0 : 180, abs(haxis) * moveVelocity)


	if(vaxis > .5)
	{
		sprite_index = jumpingSprite
		addVector(90,22)
		grounded = 0;
	}
}

handObj.shoulderX = x;
handObj.shoulderY = y;