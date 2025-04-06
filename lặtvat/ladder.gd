extends Area2D

var in_area = false
var run = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	$"../nutnhan/nutn".play("bt")
	$keothang.play("thangxuong")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if in_area == true and run ==2:
		$keothang.play("thanglen")
		run = 1
		print("lên")
		#print(Dialogic.VAR.cauhoicayakquy)
	if in_area == true and Dialogic.VAR.cauhoicayakquy == 6:
		$keothang.play("thanglen")
		await get_tree().create_timer(1.0).timeout
		self.queue_free()
		run = 1
	if in_area == false and run == 3:
		$keothang.play("thangxuong")
		run =1 
	
func run_dialogue(dialogue_string): #func chạy hộp hội thoại cú pháp run_dialogue("tên hội thoại")
	Dialogic.start(dialogue_string)

func _on_nutnhan_body_entered(body):
	if body.has_method("main"):
		$"../nutnhan/nutn".play("nhanx")
		in_area = true
		run = 2
		


func _on_nutnhan_body_exited(body):
	if body.has_method("main"):
		$"../nutnhan/nutn".play("nhanl")
		in_area = false
		run = 3
	if  Dialogic.VAR.cauhoicayakquy == 4:
		in_area = true

