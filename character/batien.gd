extends CharacterBody2D


#@onready var bgms = $nhacbatien
var bgmson = true



# Called every frame. 'delta' is the elapsed time since the previous frame.
	
	


var in_area = false
var in_lasen = false
func _ready():
	pass
func _process(delta):
	print(Dialogic.VAR.causaiak)
	print(in_area)
	#up_date_music_start()
	if in_lasen == true:
		$AnimatedSprite2D.play("batien")
		run_dialogue("batien")
		in_lasen = false
		$"../LáSen(mèoĐiĐc)4/lasen".queue_free()
	if in_area == true:
		#if Input.is_action_just_pressed("ui_accept"):
			if Dialogic.VAR.btien != true :
				run_dialogue("bttt")
				in_area = false
			if Dialogic.VAR.btien == true and Dialogic.VAR.causaiak == 0:
				get_tree().change_scene_to_file("res://4 màn hình cơ bản/pbtien.tscn")
				in_area = true
				Dialogic.VAR.btien = false
	if Dialogic.VAR.btien == true:
		in_area =true
func run_dialogue(dialogue_string): #func chạy hộp hội thoại cú pháp run_dialogue("tên hội thoại")
	Dialogic.start(dialogue_string)


func _on_area_2d_body_entered(body):
	if body.has_method("main"):
		in_area = true
		Dialogic.VAR.inarea = true


func _on_area_2d_body_exited(body):
	if body.has_method("main"):
		in_area = false
		Dialogic.VAR.inarea = false


func _on_lasen_body_entered(body):
	if body.has_method("main"):
		in_lasen = true
#func up_date_music_start():
	#if bgmson== true:
		#if !bgms.playing:
			#bgms.play()
			#print("nhạc chạy")
	#else:
		#bgms.stop()
