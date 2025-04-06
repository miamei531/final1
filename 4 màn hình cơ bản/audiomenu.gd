extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$MarginContainer/VBoxContainer/GridContainer/musicSlider.value =db_to_linear(AudioServer.get_bus_volume_db(1))
	$MarginContainer/VBoxContainer/GridContainer/SFXslider.value =db_to_linear(AudioServer.get_bus_volume_db(2))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_music_slider_mouse_exited():
	release_focus()


func _on_music_slider_2_mouse_exited():
	release_focus()
