extends Control

var baihoc = ["đây là chỗ để biết bài", "đây là lý thuyết chương 1"]
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Dialogic.VAR.nhan_do.angrycab == true:
		$Label.text = baihoc[0]
	if Dialogic.VAR.chuonghoc == 1 : 
		$Label.text = baihoc[1]


func _on_button_button_down():
	self.visible = false
	Dialogic.VAR.huongdan = 5
