/// @description Insert description here
// You can write your code in this editor

shaderTimer += 3

x += move * 30
var player = (instance_place(x,y, [obj_player, obj_playerKimari]))
if (player and player != owner and check)
{
	player.playerHurt(2000, 100)
	check = false
	
}