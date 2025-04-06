extends Node2D

var is_chatting = true
var is_roaming = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if is_chatting == true:
		if Input.is_action_just_pressed("ui_accept"):
			run_dialogue("goiy")
			is_chatting = false
			print(Dialogic.VAR.huongdan)
	if Dialogic.VAR.huongdan == 1:
		$CanvasLayer/chica2.visible = true
	elif Dialogic.VAR.huongdan == 4:
		$CanvasLayer/chica2.visible = false
		await get_tree().create_timer(1).timeout
		if Dialogic.VAR.huongdan == 5 :
			get_tree().change_scene_to_file("res://đấu với angrycab.tscn")
	


func _on_button_button_down():
	$CanvasLayer/Control2.visible = true 
	Dialogic.VAR.huongdan = 4
	
func run_dialogue(dialogue_string): #func chạy hộp hội thoại cú pháp run_dialogue("tên hội thoại")
	is_chatting = true
	is_roaming = false
	Dialogic.start(dialogue_string)
