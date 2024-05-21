extends Area2D

export var speed = 400.0
var straight = true
var screen_size = Vector2.ZERO
onready var sprite_node = get_node("Sprite")

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	var direction = Vector2.ZERO
	
	if straight:
		direction.x += 1
		sprite_node.flip_h = true
	else:
		direction.x -= 1
		sprite_node.flip_h = false
	
	position.x += direction.x * speed * delta
	
	if position.x > screen_size.x:
		straight = not straight
		position.y += 64
	
	if position.x < 0:
		straight = not straight
		position.y += 64
