extends Area2D

@export var on_ladder: bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.has_method("main"):
		on_ladder = true
		


func _on_body_exited(body):
	if body.has_method("main"):
		on_ladder = false
