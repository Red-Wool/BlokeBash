/// @description Insert description here
// You can write your code in this editor

gamepad_set_axis_deadzone(0, .1)

//hand = instance_create_depth(x,y,-1,obj_test_arm)

//add velocity vector to character
function addVector(dir,length)
{
if(speed == 0)
{
	direction = dir
	speed = length
	return;
}
 xOri = speed*cos(degtorad(direction));
 yOri = speed*sin(degtorad(direction));
 xNew = length*cos(degtorad(dir));
 yNew = length*sin(degtorad(dir));
 
 direction = radtodeg(arctan((yOri+yNew)/(xOri+xNew)))
 if(yOri+yNew >= 0 && direction > 180)
 {
	 direction = direction - 180;
 }
 else if(yOri+yNew <= 0 && direction < 180)
 {
	 direction = direction + 180;
 }
 speed = sqrt(sqr(yOri+yNew) + sqr(xOri+xNew))
}
//set Y velocity to 0
function stopYVelocity()
{
	xOri = speed*cos(degtorad(direction));
	speed = xOri;
	if(xOri >= 0)
		direction = 0;
	else
		direction = 180;

}

grounded = 0;
upGravity = .40;
downGravity = .50;
moveSpeed = 5;

handObj = instance_create_depth(x,y,-10,obj_hand)
handObj.shoulderX = x
handObj.shoulderY = y
handObj.holdX = x
handObj.holdY = y
