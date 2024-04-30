global.game_manager = self

player_one = instance_create_depth(6500,5300,0,obj_player)
player_one.playerNum = 0;
player_one.handObj.playerNum = 0;
player_two = instance_create_depth(7000,5300,0,obj_player)
player_two.playerNum = 1;
player_two.handObj.playerNum = 1;
//audio_play_sound(JazzyNYC, 10, 1)

winner = 0

temp_player_one_hp = 50
temp_player_two_hp = 60

is_playing = true
can_leave = false

game_time = 99.9

function player_facing(player_num)
{
	return sign(player_num == 1 ? player_one.x-player_two.x : player_two.x-player_one.x)
}

function end_game(_death)
{
	show_debug_message(string(_death) + "winnnnner!")
	winner = 0 == _death ? player_two : player_one
	is_playing = false
	can_leave = true
	
	global.camera_fx.hit_stop(10, 20)
}
