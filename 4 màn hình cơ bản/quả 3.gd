extends CharacterBody2D


const SPEED = 50.0
const JUMP_VELOCITY = -600.0
var rdn=RandomNumberGenerator.new()
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
func _ready():
	pass

func _physics_process(delta):
	# Add the gravity.
	rdn.randomize()
	#if not is_on_floor() and Dialogic.VAR.cauhoicayakquy == 2:
	if not is_on_floor() :
		velocity.y += gravity * delta * 0.05
	if is_on_floor():
		self.queue_free()

	# Handle jump.


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.


	move_and_slide()
func run_dialogue(dialogue_string): #func chạy hộp hội thoại cú pháp run_dialogue("tên hội thoại")
	Dialogic.start(dialogue_string)
func qua():
	pass
