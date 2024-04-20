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

reach = 64;

fistSpeed = 7.5
punchVelocityAirScale = .08
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