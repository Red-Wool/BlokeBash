/// @description Insert description here
// You can write your code in this editor

draw_set_color(c_red)

draw_set_font(Romantic)

draw_text_transformed(display_get_gui_width()*.5, 10, floor(game_time),3,3,0)


draw_set_color(c_white)

draw_text_transformed(display_get_gui_width()*.1, 100, "Player 1 Here",3,3,0)

//show_debug_message(player_one.hp)

draw_healthbar(display_get_gui_width()*.01, display_get_gui_height()*.01, 
display_get_gui_width()*.45, display_get_gui_height()*.1, 
(player_one.hp/player_one.maxHP)*100, c_black, c_red, c_green, 1, true, false)

draw_healthbar(display_get_gui_width()*.01, display_get_gui_height()*.92, 
display_get_gui_width()*.43, display_get_gui_height()*.95, 
(player_one.super)*100, c_black, c_red, #ffab00, 0, true, false)

for (var i = 0; i < player_one.moveBurstMax; i++)
{
	draw_healthbar(display_get_gui_width()*.01+display_get_gui_width()*.11*i, display_get_gui_height()*.97, 
	display_get_gui_width()*.10+display_get_gui_width()*.11*i, display_get_gui_height()*.99, 
	(min(1, player_one.moveBursts - i))*100, c_black, c_blue, #42fff9, 0, true, false)
}



draw_text_transformed(display_get_gui_width()*.7, 100, "Player 2 Here",3,3,0)

draw_healthbar(display_get_gui_width()*.55, display_get_gui_height()*.01, 
display_get_gui_width()*.99, display_get_gui_height()*.1, 
(player_two.hp/player_two.maxHP)*100, c_black, c_red, c_green, 0, true, false)

draw_healthbar(display_get_gui_width()*.57, display_get_gui_height()*.92, 
display_get_gui_width()*.99, display_get_gui_height()*.95, 
(player_two.super)*100, c_black, #ff00ff, #8000ff, 1, true, false)

for (var i = 0; i < player_two.moveBurstMax; i++)
{
	draw_healthbar(display_get_gui_width()*.9-display_get_gui_width()*.11*i, display_get_gui_height()*.97, 
	display_get_gui_width()*.99-display_get_gui_width()*.11*i, display_get_gui_height()*.99, 
	(min(1, player_two.moveBursts - i))*100, c_black, c_blue, #42fff9, 1, true, false)
}

if !is_playing
{
	draw_text_transformed(display_get_gui_width()*.5, 300, winner == player_one ? "Player 1 Wins!" : "Player 2 Wins!",3,3,0)
}