extends Camera2D

@export var player:CharacterBody2D
@export var tilemap : TileMap
# Called when the node enters the scene tree for the first time.
func _ready():
	var map_rect = tilemap.get_used_rect()
	var tile_size = tilemap.cell_quadrant_size
	var world_size =map_rect.size * tile_size
	limit_right = world_size.x-100
	limit_bottom = world_size.y-100
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	position = player.position
