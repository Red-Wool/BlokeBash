playerOwner = pointer_null
playerNum = 0;

hitSFX = -1

colorShade = shader_get_uniform(OutlineShader, "outlineColor")
secondShade = shader_get_uniform(OutlineShader, "secondaryColor")
swish = shader_get_uniform(OutlineShader, "swish")
swishTimer = 0
swishX = 0;
swishY = 0;
auraPower = 0

detectRange = shader_get_uniform(OutlineShader, "detectRange")
shaderTime = shader_get_uniform(OutlineShader, "time")
aura = shader_get_uniform(OutlineShader, "aura")
shaderTimer = 0

shoulderX = 0;
shoulderY = 0;

holdX = 0;
holdY = 0;

targetX = 0;
targetY = 0;

currentX = 0;
currentY = 0;

prevX = 0;

reach = 300;

currentFistSpeed = 25

fistPower = 0
fistSpeed = 25
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
heavyHit = 0;
attackFrames = 30;
cooldownFrames = 20;

currentAttack = 0
currentCooldown = 0

UpperArmLength = 150;
LowerArmLength = 150;
shoulderHandDistance = 0;
UpperArmObj = instance_create_depth(x,y,-10,obj_upperArm)
UpperArmObj.hand = id;
LowerArmObj = instance_create_depth(x,y,-10,obj_lowerArm)
LowerArmObj.hand = id;

dipper = 1;
active = 0;
cooldown = 0;
hitStun = 0;