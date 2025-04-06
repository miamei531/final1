extends CharacterBody2D

@onready var amin =$AnimatedSprite2D
var in_area = false
func _ready():
	amin.play("normal")
func _process(delta):
	#Dialogic.VAR.caythegioi = 0
	#if Input.is_action_just_pressed("ui_accept"):
		if in_area == true:
			run_dialogue("sautomo")
			if Dialogic.VAR.tran != 2:
				amin.play("angry")
			if Dialogic.VAR.tran == 2:
				amin.play("normal")
				get_node("AnimatedSprite2D").flip_h = true
				$AnimationPlayer.play("nhaylen")
				$sau.queue_free()
				
			in_area = false
		if Input.is_action_just_pressed("ui_accept") and Dialogic.VAR.caythegioi == 1 and Dialogic.VAR.tran != 2:
				get_tree().change_scene_to_file("res://lặtvat/tường.tscn")
				print("hehe")
				#in_area = false
	
			



func run_dialogue(dialogue_string): #func chạy hộp hội thoại cú pháp run_dialogue("tên hội thoại")
	Dialogic.start(dialogue_string)


func _on_sau_body_entered(body):
	if body.has_method("main"):
		in_area = true
		Dialogic.VAR.inarea = true

func _on_sau_body_exited(body):
	if body.has_method("main"):
		in_area = false
		Dialogic.VAR.inarea = false
