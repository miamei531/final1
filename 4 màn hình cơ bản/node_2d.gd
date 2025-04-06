extends Node2D

@onready var bgms = $bg
var bgmson = true
var in_are = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	up_date_music_start()
	if in_are == true:
		run_dialogue("dcam")
		in_are= false
func up_date_music_start():
	if bgmson== true:
		if !bgms.playing:
			bgms.play()
			print("nhạc chạy")
	else:
		bgms.stop()


func _on_cam_body_entered(body):
	if body.has_method("main"):
		in_are = true
func run_dialogue(dialogue_string): #chạy dialoc
	Dialogic.start(dialogue_string)

