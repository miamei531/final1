extends Control


# Called when the node enters the scene tree for the first time.
func on_player_update_ui(playerpos):
	$currentpos.text = "Current Position:" + str(playerpos)
