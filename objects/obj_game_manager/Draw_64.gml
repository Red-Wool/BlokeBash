/// @description Insert description here
// You can write your code in this editor

draw_set_color(c_red)

draw_text_transformed(display_get_gui_width()*.5, 10, floor(game_time),3,3,0)


draw_set_color(c_white)

draw_text_transformed(display_get_gui_width()*.1, 100, "Player 1 Here",3,3,0)

//show_debug_message(player_one.hp)

draw_healthbar(display_get_gui_width()*.01, display_get_gui_height()*.01, 
display_get_gui_width()*.45, display_get_gui_width()*.05, 
(player_one.hp/player_one.maxHP)*100, c_black, c_red, c_green, 0, true, false)

draw_text_transformed(display_get_gui_width()*.7, 100, "Player 2 Here",3,3,0)

draw_healthbar(display_get_gui_width()*.55, display_get_gui_height()*.01, 
display_get_gui_width()*.99, display_get_gui_width()*.05, 
temp_player_two_hp, c_black, c_red, c_green, 1, true, false)

if !is_playing
{
	draw_text_transformed(display_get_gui_width()*.5, 300, winner == player_one ? "Player 1 Wins!" : "Player 2 Wins!",3,3,0)
}