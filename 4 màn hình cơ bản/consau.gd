extends Node2D


@onready var bgms = $caytg
@onready var tien = $tien
var bgmson = true
var in_la = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	up_date_music_start()
	if Dialogic.VAR.xong == true:
		get_tree().change_scene_to_file("res://4 màn hình cơ bản/video.tscn")
		print("chuyển sang video")
func up_date_music_start():
	if bgmson == true and in_la == false:
		if !bgms.playing:
			bgms.play()
			print("nhạc chạy")

		
	else:
		bgms.stop()
	if in_la == true:
		bgms.stop()
		if !tien.playing:
			tien.play()
			print("tienplay")
		else: 
			tien.stop()
		in_la = false
		#$"LáSen(mèoĐiĐc)4/lasen".queue_free()




func _on_lasen_body_entered(body):
	if body.has_method("main"):
		in_la = true
		print("trong lá")
