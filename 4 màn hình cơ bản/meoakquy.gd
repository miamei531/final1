extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var in_area = false
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var anm = $AnimatedSprite2D

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor() and in_area == false:
		velocity.y = JUMP_VELOCITY
	if Input.is_action_just_pressed("ui_accept") and in_area == true:
		Dialogic.start("qua1")
		print("qua1")
		in_area = false

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_area_2d_body_entered(body):
	if body.has_method("qua"):
		in_area = true
		Dialogic.VAR.inarea = true
func run_dialogue(dialogue_string): #func chạy hộp hội thoại cú pháp run_dialogue("tên hội thoại")
	Dialogic.start(dialogue_string)
