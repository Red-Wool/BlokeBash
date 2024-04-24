/// @description Insert description here
// You can write your code in this editor

gamepad_set_axis_deadzone(0, .1)

//hand = instance_create_depth(x,y,-1,obj_test_arm)

//add velocity vector to character
function addVector(dir,length)
{
	
	/*
	show_debug_message(dir)
	show_debug_message(length)
	show_debug_message("apply")
	*/
	
	if(speed < 0.1)
	{
		direction = dir
		speed = length
		return;
	}
	
	 xOri = speed*cos(degtorad(direction));
	 yOri = -speed*sin(degtorad(direction));
	 xNew = length*cos(degtorad(dir));
	 yNew = -length*sin(degtorad(dir));
	 direction = point_direction(0,0,xOri+xNew, yOri+yNew) //radtodeg(arctan((yOri+yNew)/(xOri+xNew)))
	  
	  //show_debug_message(xOri, " ", xNew)
	
	
	 /*if abs(direction) > 1
	 {
		 if(yOri+yNew > 0 && direction > 181)
		 {
			 direction = 360-direction;
		 }
		 else if(yOri+yNew < 0 && direction < 179)
		 {
			 direction = 360-direction;
		 }
	 }*/
	 
	 speed = sqrt(sqr(yOri+yNew) + sqr(xOri+xNew))
}

function processPhysics()
{
	
}

//set Y velocity to 0
function stopYVelocity()
{
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
	
	xOri = speed*cos(degtorad(direction));
	
	show_debug_message(string(xOri) + " Land")
	speed = abs(xOri)
	if(xOri >= 0)
		direction = 0;
	else
		direction = 180;

}

function touchWall(wall)
{
	if wall.checkScreenCrash()
	{
		wall.applyScreenCrash(self)
	}
	else if wall.side_x != 0
	{
		for (var i = 0; i < 10; i++)
		{
			if(place_meeting(x,y,obj_death_wall))
			{
				x -= sign(wall.side_x)
			}
			else
			{
				break
			}
		}
		
		xOri = speed*cos(degtorad(direction));
		yOri = -speed*sin(degtorad(direction));
		if abs(xOri) > 1
		{
			//XOri = -speed*sin(degtorad(direction));
		
			xOri *= -wallBounceDecay
			
			show_debug_message(xOri)
			
			direction = point_direction(0,0,xOri, yOri)
			speed = sqrt(sqr(yOri) + sqr(xOri))
		}
	}
	else if wall.side_y != 0
	{
		for (var i = 0; i < 10; i++)
		{
			if(place_meeting(x,y,obj_death_wall))
			{
				y -= sign(wall.side_y)
			}
			else
			{
				break
			}
		}
		
		xOri = speed*cos(degtorad(direction));
		yOri = -speed*sin(degtorad(direction));
		if abs(yOri) > 1
		{
			//XOri = -speed*sin(degtorad(direction));
		
			yOri = 0
			
			show_debug_message(yOri)
			
			direction = point_direction(0,0,xOri, yOri)
			speed = sqrt(sqr(yOri) + sqr(xOri))
		}
	}
}

function playerHurt(damage, stun)
{
	hp -= damage
	if hp <= 0
	{
		death()	
	}
	
	hitStun = stun
}

function death()
{
	
}

xOri = 0;
xNew = 0;
yOri = 0;
yNew = 0;

maxHP = 5000;
hp = maxHP;

grounded = 0;
upGravity = .40;
downGravity = .50;
moveSpeed = 5;
moveVelocity = .2;

groundFriction = .9;
moveFriction = .95;
airDecay = .99;

wallBounceDecay = .5;

hitStop = 0;
hitStun = 0;
endLag = 0;

handObj = instance_create_depth(x,y,-10,obj_hand)
handObj.playerOwner = self
handObj.shoulderX = x
handObj.shoulderY = y
handObj.holdX = x
handObj.holdY = y

hitStun = 0;


idleSprite = spr_JoshJacketIdle;
walkSprite = spr_JoshJacketWalk;
backWalkSprite = spr_JoshJacketBackWalk;
landingSprite = tempLanding
jumpingSprite = tempJump
hitSprite = 0;
deathSprite = 0;
airSprite = tempAir;
