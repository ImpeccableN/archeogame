extends Area2D


export var speed = 400.0
export var starting_position = Vector2(514, 352)
var row_size = 64
var screen_size = Vector2(1024, 1088)

signal set_marker(player_position)
signal hit


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
	
#	if direction.length() > 1:
#		direction = direction.normalized();
	
	if Input.is_action_just_pressed("set_marker"):
			emit_signal("set_marker", position)
	
	position.x += direction.x * delta * speed
	position.y += direction.y * row_size
	position.x = clamp(position.x, 32, screen_size.x - 32)
	position.y = clamp(position.y, 32, screen_size.y - 32)

func start():
	position = starting_position
	show()
	$CollisionShape2D.disabled = false

func _on_Player_body_entered(_body):
	hide()
	$CollisionShape2D.set_deferred("disabled", true)
	emit_signal("hit")
	print("hit")
