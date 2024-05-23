extends Area2D


export var speed = 400.0
var body_size = Vector2.ZERO
var screen_size = Vector2.ZERO

signal set_marker(player_position)

func _ready():
	screen_size = get_viewport_rect().size
	body_size = get_node("Sprite").get_rect().size
	print(body_size)


func _process(delta):
	var direction = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	
	if Input.is_action_just_pressed("move_down"):
		direction.y += 1
	if Input.is_action_just_pressed("move_up"):
		direction.y -= 1
	
	if direction.length() > 1:
		direction = direction.normalized();
	
	if Input.is_action_just_pressed("set_marker"):
			emit_signal("set_marker", position)
	
	position.x += direction.x * delta * speed
	position.y += direction.y * body_size.y
	position.x = clamp(position.x, 32, screen_size.x - 32)
	position.y = clamp(position.y, 32, screen_size.y - 32)
	
