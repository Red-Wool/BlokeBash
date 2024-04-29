playerOwner = pointer_null

shoulderX = 0;
shoulderY = 0;

holdX = 0;
holdY = 0;

targetX = 0;
targetY = 0;

currentX = 0;
currentY = 0;

prevX = 0;

reach = 180;


fistPower = 0
fistSpeed = 12.5
hitFistSpeed = 25
superFistSpeed = 100

punchVelocityAirScale = .04
punchVelocityGroundScale = .06

heavyPunchVelocityAirScale = .06
heavyPunchVelocityGroundScale = .12

function isHitting()
{
	return hit > cooldownFrames
}

function moveTowards(start,target,pace)
{
	if(abs(target - start) < pace)
	{
		return target;
	}
	return(pace*sign(target - start)+start)
}

cursorlock = 0;

s = 1

p = 0;
hit = 0;
attackFrames = 30;
cooldownFrames = 20;

currentAttack = 0
currentCooldown = 0

UpperArmLength = 100;
LowerArmLength = 100;
shoulderHandDistance = 0;
UpperArmObj = instance_create_depth(x,y,-10,obj_upperArm)
LowerArmObj = instance_create_depth(x,y,-10,obj_lowerArm)