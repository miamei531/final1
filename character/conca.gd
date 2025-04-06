extends CharacterBody2D


var player_in_area = false
var is_chatting = true
var is_roaming = false
func _ready():
	player_in_area = false
	if Dialogic.VAR.huongdan == 6:
		self.visible = false
func _process(_delta):
	if player_in_area == true: # nếu người chơi có trong vùng tiếp xúc
		#if Input.is_action_just_pressed("ui_accept"): # khi mà người chơi ấn nún space thì :
			if Dialogic.VAR.nhan_do.co_be_ca == true and $"../Sprite2D".co_be == true:
				run_dialogue("đưa cá đi") #chạy hộp hội thoại
				visible = false
				queue_free() 
				player_in_area = false
			elif Dialogic.VAR.nhan_do.co_be_ca == true and $"../Sprite2D".co_be == false:
				run_dialogue("jztr")
				player_in_area = false
			else:
				run_dialogue("chào")
				player_in_area = false
				print("dialog")
		

func run_dialogue(dialogue_string): #func chạy hộp hội thoại cú pháp run_dialogue("tên hội thoại")
	is_chatting = true
	is_roaming = false
	Dialogic.start(dialogue_string)


func _on_area_2d_body_entered(body): # xét nhân vật có trong collusion shape không
	if body.has_method("main"): #nếu thứ tiếp xúc với collusion shape có func main()
		print("nhân vật đang trong collusion shape")
		player_in_area = true
		Dialogic.VAR.nhan_do.vitri = 1
	


func _on_area_2d_body_exited(body):
	if body.has_method("main"):
		print("nhân vật thoát ra collusion shape")
		
		player_in_area = false

