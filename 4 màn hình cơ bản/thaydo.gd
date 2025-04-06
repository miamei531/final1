extends Node2D

@onready var anim = $AnimatedSprite2D
func _ready():
	anim.play("skin ")

	
func _on_thoát_button_down():
	get_tree().change_scene_to_file("res://4 màn hình cơ bản/menu.tscn")
	


func _on_button_button_down():
	anim.play("skin ")


func _on_button_2_button_down():
	anim.play("skin 2")


func _on_button_3_button_down():
	anim.play("skin 3")


func _on_button_4_button_down():
	anim.play("skin 4")


func _on_button_5_button_down():
	anim.play("skin 5")


func _on_button_6_button_down():
	anim.play("skin 6")


func _on_button_7_button_down():
	anim.play("skin 7")


func _on_button_8_button_down():
	anim.play("skin 8")


func _on_button_9_button_down():
	anim.play("skin 9")
