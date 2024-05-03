global.game_manager = self
o = obj_player;
if(global.player_one_character == 1)
	o = obj_playerKimari
player_one = instance_create_depth(12000,11000,0,o)
player_one.playerNum = 0;
player_one.handObj.playerNum = 0;
o = obj_player;
if(global.player_two_character == 1)
	o = obj_playerKimari
player_two = instance_create_depth(13000,11000,0,o)
player_two.playerNum = 1;
player_two.handObj.playerNum = 1;

music = audio_play_sound(JazzyNYC, 10, 1)

function god_walker()
{
	audio_sound_pitch(music, .5)	
	audio_sound_gain(music, .3, 0)
	audio_sound_gain(music, 1, 2000)
	alarm[0] = 200
}

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
	audio_stop_sound(JazzyNYC)
	
	show_debug_message(string(_death) + "winnnnner!")
	winner = 0 == _death ? player_two : player_one
	is_playing = false
	can_leave = true
	
	global.camera_fx.hit_stop(10, 20)
}
