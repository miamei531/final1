extends Node2D
@onready var bgms = $bg
var bgmson = true
var in_area = false 
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#if Input.is_action_just_pressed("ui_accept"):
		if in_area ==true:
			get_tree().change_scene_to_file("res://4 màn hình cơ bản/consau.tscn")


func _on_vaocay_body_entered(body):
	up_date_music_start()
	if body.has_method("main"):
		in_area = true
		Dialogic.VAR.inarea = true
func up_date_music_start():
	if bgmson== true:
		if !bgms.playing:
			bgms.play()
			print("nhạc chạy")
	else:
		bgms.stop()


func _on_button_button_down():
	$Control.visible = true
