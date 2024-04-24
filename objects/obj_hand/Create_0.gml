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

fistSpeed = 12.5
punchVelocityAirScale = .04
punchVelocityGroundScale = .06

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

p = 0;
hit = 0;
attackFrames = 30;
cooldownFrames = 20;

UpperArmLength = 100;
LowerArmLength = 100;
shoulderHandDistance = 0;
UpperArmObj = instance_create_depth(x,y,-10,obj_upperArm)
LowerArmObj = instance_create_depth(x,y,-10,obj_lowerArm)