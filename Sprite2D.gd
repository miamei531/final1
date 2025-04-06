extends Sprite2D

var in_area = false
var co_be =false
var is_chatting = true
var is_roaming = false
@onready var pic = $nhatbe
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delt a' is the elapsed time since the previous frame.
func _process(_delta):
	#print(in_area)
	#if Input.is_action_just_pressed("ui_accept"):
		if in_area == true and Dialogic.VAR.nhan_do.co_be_ca == true:
			visible = false
			if !pic.playing and co_be == false:
				pic.play()
				
			co_be = true
		elif in_area == true and Dialogic.VAR.nhan_do.co_be_ca == false:
			run_dialogue("cái gì đây")
			in_area = false
			
	
func run_dialogue(dialogue_string): #chạy dialoc
	is_chatting = true
	is_roaming = false
	Dialogic.start(dialogue_string)



func _on_becarong_body_entered(body):
	if body.has_method("main"):
		in_area = true
		print("nhân vật đang lấy bể")
