extends Node2D

var is_chattings = true
var is_roamings = false
@onready var bgms = $argaudio
@onready var sai=$sai
var bgmson = true
# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("normal")
	$"con mèo".play("normal")
	Dialogic.VAR.tran = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if is_chattings == true:
		if Input.is_action_just_pressed("ui_accept"):
			print("nói chuyện")
			
			run_dialogue("bangrycab")
			$Label2.visible = false
			print("qua rồi nha")
			Dialogic.VAR.nhan_do.ans = 0
			#tree_exited
			is_chattings = false
	if Dialogic.VAR.nhan_do.ans == 1:
		bgmson = false
		if !sai.playing:
			sai.play()
		$"con mèo".play("dead")
		await get_tree().create_timer(1).timeout
		sai.stop()
		bgmson=true
		$"con mèo".play("normal")
	if Dialogic.VAR.nhan_do.ans == 2:
		$"con mèo".play("dead")
		await get_tree().create_timer(1).timeout
		$"con mèo".play("normal")
	if Dialogic.VAR.nhan_do.ans == 3:
		$"con mèo".play("lose")
		await get_tree().create_timer(1).timeout
		$"con mèo".play("normal")
func run_dialogue(dialogue_string): #func chạy hộp hội thoại cú pháp run_dialogue("tên hội thoại")
	is_chattings = true
	is_roamings = false
	Dialogic.start(dialogue_string)


func _on_button_button_down():
	$CanvasLayer/Control2.visible = true

func up_date_music_start():
	if bgmson== true:
		if !bgms.playing:
			bgms.play()
			print("nhạc chạy")
	else:
		bgms.stop()

