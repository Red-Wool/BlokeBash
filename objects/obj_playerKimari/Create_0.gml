/// @description Insert description here
// You can write your code in this editor

gamepad_set_axis_deadzone(0, .1)

sprite_index = global.player_one_character == 1 ? spr_dummy : spr_body

aliveFlag = true

colorShade = shader_get_uniform(OutlineShader, "outlineColor")
secondShade = shader_get_uniform(OutlineShader, "secondaryColor")
swish = shader_get_uniform(OutlineShader, "swish")
swishTimer = 0
swishX = 0;
swishY = 0;
detectRange = shader_get_uniform(OutlineShader, "detectRange")
shaderTime = shader_get_uniform(OutlineShader, "time")
aura = shader_get_uniform(OutlineShader, "aura")
shaderTimer = 0

punchSFXList = [JoshPunch1, JoshPunch2, JoshPunch3]
heavyPunchSFXList = [JoshHeavyPunch1, JoshHeavyPunch2]
hurtSFXList = [JoshHurt1, JoshHurt2, JoshHurt3]
sfxID = -1

audio_play_sound(JoshingTime, 0, 0)

//hand = instance_create_depth(x,y,-1,obj_test_arm)

//add velocity vector to character
function scaleHit(dir, length)
{
	xNew = length*cos(degtorad(dir));
	yNew = -length*sin(degtorad(dir));
	
	yNew *= yComboDecay
	
	addVector(point_direction(0,0,xNew, yNew), length)	
}

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
			y -= 5
		}
		else
		{
			break
		}
	}
	
	xOri = speed*cos(degtorad(direction));
	
	
	audio_play_sound(LandSFX, 0, 0, .3, 0, random_range(.9,1.1))
	//show_debug_message(string(xOri) + " Land")
	
	speed = abs(xOri)
	if(xOri >= 0)
		direction = 0;
	else
		direction = 180;

}

function touchWall(wall)
{
	var mult = 1
	
	if wall.checkScreenCrash()
	{
		global.camera_fx.screen_shake(10,15)
		wall.applyScreenCrash(self)
		mult = .1
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
			
			show_debug_message(string(xOri) + " UR")
			
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
		
			yOri = max(0, yOri)
			
			show_debug_message(string(yOri) + "YHa")
			
			direction = point_direction(0,0,xOri, yOri)
			speed = sqrt(sqr(yOri) + sqr(xOri))
		}
	}
	
	wall.applyScreenSmash(speed * mult, direction)
}

function playerHurt(damage, stun)
{
	audio_stop_sound(sfxID)
	sfxID = audio_play_sound(hurtSFXList[irandom_range(0, array_length(hurtSFXList)-1)], 0, 0)
	yComboDecay = max(0, yComboDecay - .1)
	
	hp -= damage
	if hp <= 0 and aliveFlag
	{
		death()	
	}
	
	hitStun = stun
}
d = 0;
function death()
{
	d = 1;
	aliveFlag = false
	global.game_manager.end_game(playerNum)
	audio_stop_sound(sfxID)
	sprite_index = deathSprite;
	audio_play_sound(JoshDeath, 0, 0)
}

xOri = 0;
xNew = 0;
yOri = 0;
yNew = 0;

playerNum = 0

super = 0

yComboDecay = 1


maxHP = 5000;
hp = maxHP;

grounded = 0;
upGravity = .60;
downGravity = .80;
moveSpeed = 8;
moveVelocity = .2;

groundFriction = .9;
groundDashFriction = .98;
moveFriction = .95;
airDecay = .99;


wallBounceDecay = .5;

hitStop = 0;
hitStun = 0;
endLag = 0;

moveBursts = 50
moveBurstGroundForce = 50
moveBurstAirForce = 20

moveBurstTimer= 0
moveBurstGroundTime = 3
moveBurstAirTime = 25

handObj = instance_create_depth(x,y,-10,obj_hand)
handObj.playerOwner = id
handObj.shoulderX = x
handObj.shoulderY = y
handObj.holdX = x
handObj.holdY = y


hitStun = 0;


idleSprite = spr_KimariIdle;
walkSprite = spr_KimariWalk;
backWalkSprite = spr_KimariBackWalk;
landingSpriteA = spr_KimariLanding;
landingSpriteB = spr_JoshJacketLandingB;
jumpingSpriteA = spr_KimariLeapA
jumpingSpriteB = spr_KimariLeapB
hitSprite = spr_KimariHurt;
deathSprite = 0;
airSprite = spr_KimariAir;

walkSound = -1

//Small variables do not touch
s = 1

//movement burst
bursting = 0;

