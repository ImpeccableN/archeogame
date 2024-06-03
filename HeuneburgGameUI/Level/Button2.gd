extends Button


func _ready():
	hide()


func _physics_process(delta):
	if Input.is_action_just_pressed("accept"):
		show()
