extends Area2D

var mouse_entered = false
var dictionary : Dictionary
var task_name = ""
var image_path = ""
var dropped = false
onready var node = get_node(".")

signal icon_dropped(node)


func _on_Werkzeug_mouse_entered():
	mouse_entered = true


func _on_Werkzeug_mouse_exited():
	mouse_entered = false


func _process(_delta):
	if mouse_entered and Input.is_mouse_button_pressed(BUTTON_LEFT):
		position = get_global_mouse_position()
		raise()
	if mouse_entered and Input.is_action_just_released("click_button"):
		dropped = true
		emit_signal("icon_dropped")
	if mouse_entered and Input.is_action_just_pressed("click_button"):
		dropped = false


func initiate(name):
	task_name = name
	load_json_data()


func load_json_data():
# Retrieve data
	var file = File.new()
	file.open("res://Data/aufgabenData.json", File.READ)
	var content = file.get_as_text()
	file.close()
	var json_parse = JSON.parse(content)
	if json_parse.error == OK:
		if typeof(json_parse.result) == TYPE_ARRAY:
			var parse_array = json_parse.result
			for result in parse_array:
				if result.Task == task_name:
					dictionary = result
	else:
		print("FatalError")
