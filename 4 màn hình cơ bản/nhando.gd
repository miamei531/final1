extends Panel
var is_chatting = true
@onready var opensound = $"../../rương/open"
@onready var show = $"../../rương/show"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_button_button_down():
	self.visible = false
	$"../../rương".visible = false
	if is_chatting == true:
		run_dialogue("rương đồ ")
		is_chatting = false
func run_dialogue(dialogue_string): #func chạy hộp hội thoại cú pháp run_dialogue("tên hội thoại")
	is_chatting = true
	Dialogic.start(dialogue_string)


func _on_rương_button_down():
	self.visible = true
	if !opensound.playing:
		opensound.play()
		await get_tree().create_timer(0.4).timeout
		opensound.stop()
		if !show.playing:
			show.play()
			await get_tree().create_timer(0.4).timeout
			show.stop()
	
	
