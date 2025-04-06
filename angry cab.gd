extends CharacterBody2D


const SPEED = 30
var main = null
var player_in  = false 
var is_chatting = true
var is_roaming = false
var vochoi= false
func _ready():
	$AnimatedSprite2D.play("normal")
	if  Dialogic.VAR.huongdan == 6:
		self.visible = false
		self.position = Vector2(524,800)
		player_in = false
func _physics_process(_delta):
	#if Input.is_action_just_pressed("ui_accept"):
	if player_in == true:
		run_dialogue("angrycab")
		player_in = false
		vochoi= true
	if Input.is_action_just_pressed("ui_accept") and Dialogic.VAR.nhan_do.angrycab == true and vochoi==true :
				get_tree().change_scene_to_file("res://lặtvat/chicamh.tscn")
	'''if player_in and Dialogic.VAR.nhan_do.đi_thoi == true:
		position += (main.position - position)/SPEED
		await get_tree().create_timer(2).timeout
		$"../ui/mạng 3".visible = false
		await get_tree().create_timer(2).timeout
		$"../ui/mạng 2".visible = false
		await get_tree().create_timer(2).timeout
		$"../ui/mạng 1".visible = false'''


func _on_nhân_diện_người_chơi_body_entered(body):
	if body.has_method("main"):
		player_in = true
		main = body
		print("ngời chơi đã vô angry cab")


func _on_nhân_diện_người_chơi_body_exited(body):
	if body.has_method("main"):
		player_in = false
		main = null
		print("ngời chơi đã ra angry cab")
func run_dialogue(dialogue_string): #func chạy hộp hội thoại cú pháp run_dialogue("tên hội thoại")
	is_chatting = true
	is_roaming = false
	Dialogic.start(dialogue_string)
