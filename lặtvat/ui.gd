extends CanvasLayer
@export
var bus_name :String
var bus_index: int
@onready var bgms = $bgm

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bus_index = AudioServer.get_bus_index(bus_name)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	AudioServer.set_bus_volume_db(1 , linear_to_db($menu/MarginContainer/VBoxContainer/GridContainer/musicSlider.value))
	AudioServer.set_bus_volume_db(2 , linear_to_db($menu/MarginContainer/VBoxContainer/GridContainer/SFXslider.value))
	up_date_music_start()


func _on_music_slider_value_changed(_value):
	pass # Replace with function body.


func _on_music_slider_2_value_changed(_value):
	pass # Replace with function body.


func _on_thoát_button_down():
	#AudioServer.set_bus_volume_db(1 , linear_to_db($menu/MarginContainer/VBoxContainer/GridContainer/musicSlider.value))
	#AudioServer.set_bus_volume_db(2 , linear_to_db($menu/MarginContainer/VBoxContainer/GridContainer/SFXslider.value))
	get_tree().change_scene_to_file("res://4 màn hình cơ bản/menu.tscn")
func up_date_music_start():
	if !bgms.playing:
		bgms.play()
		print("nhạc chạy")
