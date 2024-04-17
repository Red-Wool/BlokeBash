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