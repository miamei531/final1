extends CanvasLayer

var is_chatting = true
var is_roaming = false
var check = 0
var chuyen = true
# Called when the node enters the scene tree for the first time.
func _ready():
	if self.get_parent() == null:
		print("Warning: Node is not attached to any parent.")
	else:
		print("Node is attached to parent.")

#Dialogic.VAR.socauhoi == Dialogic.VAR.tongcauhoi and
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):

	if  Dialogic.VAR.tongcauhoi != 0 and Dialogic.VAR.het == true :
		if Dialogic.VAR.nhan_do.ans == 13:
			check = 1
			$win.visible = false
			$lose.visible = true
			
		elif Dialogic.VAR.nhan_do.ans != 3 and check != 1 :
			$lose.visible = false
			$win.visible = true
		Dialogic.VAR.het = false
	'''if Dialogic.VAR.huongdan == 1:
		$chica.visible = trueS
		#$chiso.visible = false
	else:
		$chica.visible = false'''
	if Dialogic.VAR.huongdan == 3:
		$chiso.visible = true
		#$chica.visible = false
		'''await get_tree().create_timer(1).timeout
		$chiso.visible = false'''
	else:
		$chiso.visible = false
	#Dialogic.VAR.huongdan = 0
	if Dialogic.VAR.causaiak == 6:
		$lose.visible = true
	elif Dialogic.VAR.cauhoicayakquy == 4:
		$win.visible = true
func run_dialogue(dialogue_string): #func chạy hộp hội thoại cú pháp run_dialogue("tên hội thoại")
	is_chatting = true
	is_roaming = false
	Dialogic.start(dialogue_string)


func _on_button_button_down():
	if Dialogic.VAR.tran == 1:
		Dialogic.VAR.huongdan = 6
		get_tree().change_scene_to_file("res://4 màn hình cơ bản/node_2d.tscn")
	if Dialogic.VAR.tran == 2 :
		Dialogic.VAR.huongdan = 8
		get_tree().change_scene_to_file("res://4 màn hình cơ bản/consau.tscn")
		print("sau")
		chuyen = false
	if Dialogic.VAR.cauhoicayakquy == 4 :
		var scene_tree = get_tree()
		print("Trying to change to: res://4 màn hình cơ bản/consau.tscn")
		if scene_tree != null:
			var result = get_tree().change_scene_to_file("res://4 màn hình cơ bản/consau.tscn")
			if result != OK:
				print("Failed to load scene: res://4 màn hình cơ bản/consau.tscn")
			else:
				print("Error: SceneTree reference is null.")

func _on_button_2_button_down():
	if Dialogic.VAR.tran == 1:
		Dialogic.VAR.huongdan = 6
		get_tree().change_scene_to_file("res://4 màn hình cơ bản/node_2d.tscn")
	if Dialogic.VAR.tran == 2:
		Dialogic.VAR.huongdan = 8
		get_tree().change_scene_to_file("res://4 màn hình cơ bản/consau.tscn")
		Dialogic.VAR.tran = 3
	if Dialogic.VAR.cauhoicayakquy == 4:
		get_tree().change_scene_to_file("res://4 màn hình cơ bản/consau.tscn")
