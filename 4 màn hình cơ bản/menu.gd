extends Node2D

@onready var bgms = $menu
func _process(delta):
	up_date_music_start()
func _on_start_button_down():
	get_tree().change_scene_to_file("res://4 màn hình cơ bản/ms.tscn")


func _on_rương_button_down():
	pass # Replace with function body.


func _on_gương_button_down():
	get_tree().change_scene_to_file("res://4 màn hình cơ bản/thaydo.tscn")


func _on_setting_button_down():
	get_tree().change_scene_to_file("res://4 màn hình cơ bản/mhsetting.tscn")


func _on_ôn_tập_button_down():
	pass # Replace with function body.


func _on_tắt_button_down():
	get_tree().quit()
func up_date_music_start():
	if !bgms.playing:
		bgms.play()
		print("nhạc chạy")
