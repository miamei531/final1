extends Node2D
@onready var aim = $CharacterBody2D/AnimationPlayer
@onready var bgms = $bg
var bgmson = true 
var hehe = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	$"ParallaxBackground/layer 2/nuoc".play("nuoc")
	#if Dialogic.VAR.causaiak == 11:
		#get_tree().change_scene_to_file("res://4 màn hình cơ bản/ms.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(Dialogic.VAR.causaiak)
	print(get_tree())
	up_date_music_start()
	if Input.is_action_just_pressed("ui_accept") and hehe == 0:
		$Label.visible = true
		$CanvasLayer.visible = false
		$"chịu".visible = false
		Dialogic.start("cauhoibt")
		aim.play("thang")
		hehe = 1
	if Dialogic.VAR.huongdan == 10:
		print("gt1")
		$"ParallaxBackground/layer 2/nuoc".play("gioithiu")
		Dialogic.VAR.huongdan = 12
	if Dialogic.VAR.huongdan == 11:
		$"ParallaxBackground/layer 2/nuoc".play("gioithiu_2")
		Dialogic.VAR.huongdan = 13
		print("gt2")
		await get_tree().create_timer(2.0).timeout
		$"ParallaxBackground/layer 2/nuoc".play("nuoc")
	#elif Dialogic.VAR.huongdan == 13:
		#$"ParallaxBackground/layer 2/nuoc".play("nuoc")
	if Dialogic.VAR.causaiak == 9:
		aim.play("thanhcong")
		await get_tree().create_timer(6.0).timeout
		get_tree().change_scene_to_file("res://4 màn hình cơ bản/consau.tscn")
		Dialogic.VAR.causaiak = 11
	elif Dialogic.VAR.causaiak == 10 :
		aim.play("rơi ")
		$"chịu".visible = true 
		Dialogic.VAR.causaiak = 11
		hehe = 0
		
		
func run_dialogue(dialogue_string): #func chạy hộp hội thoại cú pháp run_dialogue("tên hội thoại")
	Dialogic.start(dialogue_string)
func up_date_music_start():
	if bgmson== true:
		if !bgms.playing:
			bgms.play()
			print("nhạc chạy")
	else:
		bgms.stop()
