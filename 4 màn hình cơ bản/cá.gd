extends Button


func _ready():
	self.visible = false
	if Dialogic.VAR.huongdan == 6:
		self.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if  Dialogic.VAR.nhan_do.đi_thoi == true:
		self.visible = true
		Dialogic.VAR.nhan_do.đi_thoi = true


func _on_button_down():
	$"../Control".visible = true
