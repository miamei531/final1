extends CharacterBody2D
var cayak = true
var in_area = false
func _ready():
	$AnimatedSprite2D.play("normal")
func _process(delta):
	#print(Dialogic.VAR.cayak)
	if in_area == true and Dialogic.VAR.cayak == 0:
		#if Input.is_action_just_pressed("ui_accept"):
			run_dialogue("cayacquy")
			in_area = false
			cayak = false
	if Dialogic.VAR.cayacquy == true and Input.is_action_just_pressed("ui_accept") and Dialogic.VAR.cayak == 0:
			get_tree().change_scene_to_file("res://4 màn hình cơ bản/cayakquy.tscn")
			Dialogic.VAR.cayacquy = false
			Dialogic.VAR.cayak = 10
func _on_cay_body_entered(body):
	if body.has_method("main"):
		in_area = true
		Dialogic.VAR.inarea = true
		


func _on_cay_body_exited(body):
	if body.has_method("main"):
		in_area = false
		Dialogic.VAR.inarea = false
func run_dialogue(dialogue_string): #func chạy hộp hội thoại cú pháp run_dialogue("tên hội thoại")
	Dialogic.start(dialogue_string)
	
