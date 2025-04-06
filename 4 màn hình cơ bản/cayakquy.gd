extends Node2D

@onready var bgms =$bg
@onready var cry =$cry
var bgmson = true
# Called when the node enters the scene tree for the first time.
func _ready():
	$"quả 1/AnimatedSprite2D".play("quaroi")
	$"quả 2/AnimatedSprite2D2".play("quaroi")
	$"quả 3/AnimatedSprite2D3".play("quaroi")
	$"quả 4/AnimatedSprite2D4".play("quaroi")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(Dialogic.VAR.causaiak)
	up_date_music_start()
	if Dialogic.VAR.causaiak == 2  or Dialogic.VAR.causaiak == 4 or Dialogic.VAR.causaiak == 6 :
		bgmson=false
		if !cry.playing:
			await get_tree().create_timer(0.5).timeout
			cry.play()
			await get_tree().create_timer(3).timeout
			bgmson=true
			cry.stop()
		#Dialogic.VAR.causaiak = 1
func up_date_music_start():
	if bgmson== true:
		if !bgms.playing:
			bgms.play()
			print("nhạc chạy")
	else:
		bgms.stop()
