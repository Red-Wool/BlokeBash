//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform vec4 outlineColor;
uniform vec4 secondaryColor;
uniform vec2 swish;
uniform float detectRange;
uniform float aura; //0-1

uniform float time; //0-1

float rand(float s)
{
	return fract(sin(s*102.29)*49032.12);	
}

float noise(float s)
{
	float i = floor(s);
	float f = fract(s);
	
	return mix(rand(i), rand(i+1.), f);
}

float fbm (float s)
{
	float result = 0.;
	float p = .5;
	float d = .5;
	float r = 1.;
	float l = 2.;
	
	for (int i = 0; i < 5; i++)
	{
		result += noise(s*r+time*.1)*p;
		
		p *= d;
		r *= l;
	}
	
	return result;
}

void main()
{
    vec4 col = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	bool flag = false;
	
	if (col.a < .5)
	{
		for (int x = -1; x < 2; x++)
		{
			for (int y = -1; y < 2; y++)
			{
				vec2 pos = v_vTexcoord + vec2(x,y)*detectRange;
				vec4 check = texture2D( gm_BaseTexture, pos + 
				vec2(fbm(fbm(pos.y*10.)*3.12)-.5, fbm(fbm(pos.y*10.)*29.12)-.5)*.3*aura + 
				vec2(sin(pos.y*10.+time*.2)*swish.x, sin(pos.x*10.+time*.2)*swish.y));
				if (check.a > .5)
				{
					flag = true;
					break;
				}
			}
			
			if (flag)
			{
				break;	
			}
		}
		
		if (flag)
		{
			col = outlineColor;
		}
	}
	
	flag = false;
	//Full Aura
	if (aura >= .99 && col.a < .5)
	{
		for (int x = -1; x < 2; x++)
		{
			for (int y = -1; y < 2; y++)
			{
				vec2 pos = v_vTexcoord + vec2(x,y)*vec2(.2, 1.2)*(detectRange+.01)+vec2(0,.05);
				vec4 check = texture2D( gm_BaseTexture, pos + 
				vec2(fbm(fbm(pos.y*10.+time*.2)*3.12)-.5, fbm(fbm(pos.y*10.+time*.2)*29.12)-.5)*.3*aura + 
				vec2(sin(pos.y*10.+time*.2)*swish.x, sin(pos.x*10.+time*.2)*swish.y));
				if (check.a > .5)
				{
					flag = true;
					break;
				}
			}
			
			if (flag)
			{
				break;	
			}
		}
		
		if (flag)
		{
			col = secondaryColor;
		}
	}
	
	gl_FragColor = col;
	
}
