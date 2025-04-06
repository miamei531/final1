extends CharacterBody2D


var in_areas = false
var is_chatting = true
func _process(_delta):
	if is_chatting == true and in_areas == true:
		#if Input.is_action_just_pressed("ui_accept"):
			if Dialogic.VAR.chuonghoc == 1:
				get_tree().change_scene_to_file("res://4 màn hình cơ bản/cay_the_gioi.tscn")
			else :
				run_dialogue("lr")
				in_areas = false
			



func _on_vào_cây_body_entered(body):
	if body.has_method("main"):
		in_areas = true
		print("nhân vật vào cây thế giới")


func _on_vào_cây_body_exited(body):
	if body.has_method("main"):
		in_areas = false
		print("nhân vật ra cây thế giới")
func run_dialogue(dialogue_string): #func chạy hộp hội thoại cú pháp run_dialogue("tên hội thoại")
	is_chatting = true
	Dialogic.start(dialogue_string)
