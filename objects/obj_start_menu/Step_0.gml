
cutsceneTimer++

switch cutsceneSceneNum
{
	case 0:
		resize_window(max(0, sin(cutsceneTimer*.03)) * .1 + cutsceneTimer * .0006)
		set_window_pos()
		if cutsceneTimer > 600
		{
			cutsceneSceneNum++
			cutsceneTimer = 0
		}
		break
	case 1:
		
		screen_x = cos(floor(cutsceneTimer*.25)*.6) * .4 + .5
		screen_y = sin(floor(cutsceneTimer*.25)*.6) * .4 + .5
		set_window_pos()
		if cutsceneTimer > 300
		{
			cutsceneSceneNum++
			cutsceneTimer = 0
		}
		break
		
	case 2:
	
		screen_x = cos(floor(cutsceneTimer*.25)*.6) * .4 + .5
		screen_y = sin(floor(cutsceneTimer*.25)*.6) * .4 + .5
		
		if cutsceneTimer % 2 == 0
		{
			screen_x = 1 - screen_x
			screen_y = 1 - screen_y
		}
		set_window_pos()
		
		if cutsceneTimer > 120
		{
			cutsceneSceneNum++
			cutsceneTimer = 0
		}
		break
	
	case 3:
		screen_x = (cos(floor(cutsceneTimer*.25)*.6) * .4 + .5) * (1-cutsceneTimer*.00333)
		screen_y = sin(floor(cutsceneTimer*.25+40)*.6) * .4*sin(cutsceneTimer*.01) + .5
		
		if cutsceneTimer % 2 == 0
		{
			screen_x = 1 - screen_x
			screen_y = 1 - screen_y
		}
		set_window_pos()
		
		if cutsceneTimer > 300
		{
			cutsceneSceneNum++
			cutsceneTimer = 0
		}
		break
	
	case 4:
		screen_x = (1-cutsceneTimer*.05) * .4 + .5
		screen_y = .5
		
		if cutsceneTimer % 2 == 0
		{
			screen_x = 1 - screen_x
			screen_y = 1 - screen_y
		}
		set_window_pos()
		if cutsceneTimer > 20
		{
			cutsceneSceneNum++
			cutsceneTimer = 0
		}
		break
	case 5:
		screen_x = arccos(cos(cutsceneTimer*.04+pi/2))/pi
		screen_y = .5 + sin(cutsceneTimer*.1)*.01
		set_window_pos()
		
		if cutsceneTimer > 115
		{
			cutsceneSceneNum++
			cutsceneTimer = 0
			counter = 0
			screen_x = 0
		}
		
		break
	case 6:
		screen_x += .0127 + counter * .02
		if screen_x > 2.0
		{
			screen_x -= 3
			screen_y = abs(frac(sin(counter * 209.42)*49.23))*.8+.1
			counter++
		}
		
		window_set_caption(string(counter))
		
		set_window_pos()
		
		if counter > 225
		{
			cutsceneSceneNum++
			cutsceneTimer = 0
			counter = 0
			window_set_caption("The Shadow Wizard Money Gang presents...")
			
		}
		
		break
	case 7:
		screen_x = -1 + cutsceneTimer * .05
		screen_y = .5 + cutsceneTimer * .01
		set_window_pos()
		
		if cutsceneTimer > 30
		{
			cutsceneSceneNum++
			cutsceneTimer = 0
		}
		
		break
	case 8:
		var t = sin(cutsceneTimer/pi/100)
		var win = cutsceneTimer % 4 + 1
		
		screen_x = cos((pi/2) - win*t*20) * .3 + .5
		screen_y = sin((pi/2) - win*t*20) * .3 + .5
		resize_window(.1 + (win-1) * .1 * (1-cutsceneTimer*.02))
		
		set_window_pos()
		
		if cutsceneTimer > 50
		{
			cutsceneSceneNum++
			cutsceneTimer = 0
		}
		
		break
	case 9:
		screen_x = cos((pi/2) + cutsceneTimer*3) * (.3 - cutsceneTimer * .003) + .5
		screen_y = sin((pi/2) + cutsceneTimer*3) * (.3 - cutsceneTimer * .003) + .5
		
		resize_window(.1 + cutsceneTimer * .003)
		
		set_window_pos()
		
		
		
		if cutsceneTimer > 100
		{
			cutsceneSceneNum++
			cutsceneTimer = 0
			
		}
		
		break
	case 10:
		
		window_set_caption("Bloke Bash")
		
		screen_x = .5
		screen_y = .5
		
		resize_window(.4)
		
		set_window_pos()
	
}

x = center_x + screen_pos_x// (sin(test_timer * .01) * 500.)// - screen_pos_x
y = center_y + screen_pos_y

if keyboard_check_pressed(vk_space)
{
	if cutsceneSceneNum != 10
	{
		cutsceneSceneNum = 10	
	}
	else
		room_goto(SelectMenu)
}