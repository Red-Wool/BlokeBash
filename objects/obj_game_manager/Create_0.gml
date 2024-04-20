global.game_manager = self

player_one = instance_create_depth(5500,5300,0,obj_player)
player_two = pointer_null

temp_player_one_hp = 50
temp_player_two_hp = 60

is_playing = false

game_time = 99.9

function end_game(_winner)
{
	is_playing = true
}
