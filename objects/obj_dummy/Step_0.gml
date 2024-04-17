if(!grounded)
{
	if(place_meeting(x,y,obj_floor))
	{
		grounded = 1;
		stopYVelocity()
	}
	else if(direction < 180)
		addVector(270,upGravity)
	else
		addVector(270,downGravity)
}