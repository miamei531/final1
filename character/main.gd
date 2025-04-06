extends CharacterBody2D
var input_movement =Vector2.ZERO
var speed = 290
var save_file_path = "user://save/"
var save_file_name = "PlayerSave.tres"
var Playerdata = playerdata.new()
var player_in_area = false
var player_pos = Vector2.ZERO
@onready var walkaudio = $walking
@onready var anim_tree =$AnimationTree
@onready var anim_state = anim_tree.get("parameters/playback")
func _physics_process(_delta):
	if Dialogic.VAR.huongdan == 6:
		Dialogic.VAR.nhan_do.ans = 13
		self.position =Vector2(424.1669,559.5002)
		Dialogic.VAR.huongdan = 7
		_move()
	else:
		_move()
	#if $"../ui/mạng 1".visible == false:
		#self.queue_free()
		#get_tree().change_scene_to_file("res://4 màn hình cơ bản/menu.tscn")
func _move():
		#nhấn nut lên ,xuống....
	input_movement = Input.get_vector("ui_left","ui_right","ui_up","ui_down") 
	
	if input_movement != Vector2.ZERO:
		if !walkaudio.playing:
			walkaudio.play()
		anim_tree.set("parameters/idle/blend_position",input_movement) #chạy animation tree
		anim_tree.set("parameters/walk/blend_position",input_movement)
		anim_tree.set("parameters/attack/blend_position",input_movement)
		anim_state.travel("walk")
		
		velocity = input_movement * speed 
	if input_movement == Vector2.ZERO:
		anim_state.travel("idle")
		velocity = Vector2.ZERO
		walkaudio.stop()
	if Dialogic.VAR.nhan_do.ans == 1 :
		$AnimatedSprite2D.play("lose")
		await get_tree().create_timer(1).timeout
		$AnimatedSprite2D.play("right")
		
	if Dialogic.VAR.nhan_do.ans == 2:
		$AnimatedSprite2D.play("lose")
		await get_tree().create_timer(1).timeout
		$AnimatedSprite2D.play("right")
		if input_movement != Vector2.ZERO:
			anim_tree.set("parameters/idle/blend_position",input_movement) #chạy animation tree
			anim_tree.set("parameters/walk/blend_position",input_movement)
			anim_tree.set("parameters/attack/blend_position",input_movement)
			anim_state.travel("walk")
			velocity = input_movement * speed 
	if Dialogic.VAR.nhan_do.ans == 3:
		$AnimatedSprite2D.play("dead")
		await get_tree().create_timer(1).timeout
		await get_tree().create_timer(1).timeout
		if input_movement != Vector2.ZERO:
			anim_tree.set("parameters/idle/blend_position",input_movement) #chạy animation tree
			anim_tree.set("parameters/walk/blend_position",input_movement)
			anim_tree.set("parameters/attack/blend_position",input_movement)
			anim_state.travel("walk")
			velocity = input_movement * speed 
	move_and_slide()
	print(self.position)
	

		
	
	

func main():
	pass


