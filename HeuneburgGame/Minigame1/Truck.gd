extends KinematicBody2D

export var speed = 800.0
var straight = true
var screen_size = Vector2.ZERO
onready var sprite_node = get_node("Sprite")
var screen_lowerend = false

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	var direction = Vector2.ZERO
		
	# when lower end of screen is reached, truck drives upwards and changes rotation of sprite
	if screen_lowerend:
		rotation_degrees = -90
		direction = Vector2(0.0, -1.0)
	else:
		rotation_degrees = 0
		if straight:
			direction.x += 1
			sprite_node.flip_h = true
		else:
			direction.x -= 1
			sprite_node.flip_h = false
	
	position += direction * speed * delta
	
	if screen_lowerend == false && position.x >= screen_size.x - 31:
		straight = not straight
		position.y += 64
	
	if screen_lowerend == false && position.x <= 31:
		straight = not straight
		position.y += 64
	
	if position.y >= screen_size.y - 31:
		screen_lowerend = true
	
	if position.y <= 32:
		screen_lowerend = false
