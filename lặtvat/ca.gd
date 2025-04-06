extends CanvasLayer
var i = 0 
var chuyen = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("cá")
	$AnimatedSprite2D2.play("cá")
	$AnimatedSprite2D3.play("cá")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Dialogic.VAR.nhan_do.ans == 1:
		$AnimatedSprite2D3.play("cá đen")
		#Dialogic.VAR.nhan_do.ans =12
		#$"../con mèo".play("dead")
		#await get_tree().create_timer(1).timeout
		#$"../con mèo".play("normal")
	elif  Dialogic.VAR.nhan_do.ans == 2:
		$AnimatedSprite2D2.play("cá đen")
		#Dialogic.VAR.nhan_do.ans = 12
		#$"../con mèo".play("dead")
		#await get_tree().create_timer(1).timeout
		#$"../con mèo".play("normal")
	elif Dialogic.VAR.nhan_do.ans == 3:
		$AnimatedSprite2D.play("cá đen")
		#Dialogic.VAR.nhan_do.ans =12
		chuyen = 101010
		print(chuyen)
		#$"../con mèo".play("dead")
		#await get_tree().create_timer(1).timeout
		#$"../con mèo".play("normal")
		Dialogic.VAR.nhan_do.ans = 13
		print("trời ơi cứu tui")
	if Dialogic.VAR.matca ==1 :
		$AnimatedSprite2D3.play("cá đen")
	if Dialogic.VAR.matca ==2:
		$AnimatedSprite2D2.play("cá đen")
	if Dialogic.VAR.matca == 3:
		$AnimatedSprite2D.play("cá đen")
	
