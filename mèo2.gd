extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -300.0
var GRAVITY = 1000
var in_area = false
@onready var jumpaudio =$jump
@onready var walkaudio = $walk
@onready var anim_tree =$AnimationTree
@onready var anim_state = anim_tree.get("parameters/playback")
var mai = 0
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var anim = get_node("AnimationPlayer")
var on_ladder:bool= false
func _ready():
	#print( Dialogic.VAR.causaiak )
	anim.play("right")
	if Dialogic.VAR.huongdan == 8:
		self.position =Vector2(428.0001,538.9241)
		Dialogic.VAR.huongdan = 7
	if Dialogic.VAR.cauhoicayakquy == 4:
		self.position =Vector2(1116,-477)
		Dialogic.VAR.cauhoicayakquy = 6
	if Dialogic.VAR.causaiak == 9 or Dialogic.VAR.causaiak == 11:
		self.position = Vector2(1683,-2291)
		Dialogic.VAR.causaiak = 12
func _physics_process(delta):
	#print(self.position)
	# Add the gravity.
	#print(Dialogic.VAR.causaiak)
	if not is_on_floor() and !on_ladder :
		velocity.y += gravity * delta * 0.5
	if Input.is_action_just_pressed("ui_accept") and in_area == true:
		Dialogic.start("qua1")
		print("qua1")
		in_area = false
	if (Dialogic.VAR.causaiak == 2 or Dialogic.VAR.causaiak == 4 or Dialogic.VAR.causaiak == 6)  and Dialogic.VAR.cuoi == 1 :
		$AnimatedSprite2D.play("cry")
		#await $AnimatedSprite2D.animation_finished
		await get_tree().create_timer(1.0).timeout
		Dialogic.VAR.cuoi = 2
		Dialogic.VAR.causaiak = 0
		return
	if on_ladder == true:
		if Input.is_action_pressed("ui_down"):
			velocity.y = SPEED *delta*30
			anim.play("run back")
			if !jumpaudio.playing:
				jumpaudio.play()
			#print("xuống")
			#print(velocity.y)
		elif Input.is_action_pressed("ui_up"):
			velocity.y = -SPEED *delta*30
			anim.play("run back")
			if !jumpaudio.playing:
				jumpaudio.play()
			#print("lên")
		else:
			velocity.y = 0
	#print(velocity.y)

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor() and Dialogic.VAR.inarea != true and Dialogic.VAR.nhan_do.nch == false:
		velocity.y = JUMP_VELOCITY
		jumpaudio.play()
		#anim.play("jump")
	else:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
		var direction = Input.get_axis("ui_left","ui_right")
		if direction == 1:
			get_node("AnimatedSprite2D").flip_h= true
		elif direction ==-1:
			get_node("AnimatedSprite2D").flip_h=false
		if direction:
			velocity.x = direction * SPEED
			if velocity.y ==0:
				anim.play("run left")
				pass
			if is_on_floor() and !walkaudio.playing:
				walkaudio.play()
		else:
			if velocity.y ==0:
				velocity.x = move_toward(velocity.x, 0, SPEED)
				anim.play("left")
				walkaudio.stop()

		#if velocity.y>0:
			##anim.play("fall")	 
			#velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func main():
	pass



func _on_ladder_body_entered(body):
	if body.has_method("main"):
		on_ladder = true


func _on_ladder_body_exited(body):
	if body.has_method("main"):
		on_ladder = false
func _on_area_2d_body_entered(body):
	if body.has_method("qua"):
		in_area = true
		Dialogic.VAR.inarea = true
		Dialogic.VAR.cuoi = 1

func run_dialogue(dialogue_string): #func chạy hộp hội thoại cú pháp run_dialogue("tên hội thoại")
	Dialogic.start(dialogue_string)

