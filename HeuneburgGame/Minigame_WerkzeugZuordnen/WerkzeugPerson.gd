extends Area2D

var member_name : String
var member_path = "res://CharacterScenes/"
var member_scene = preload("res://TeamMember.tscn")
var task_score = 0
var initiated_member_scene : Node
var area_entered = false
var entered_task : Node


func _on_WerkzeugPerson_mouse_entered():
	$Sprite/InfoBox.show()


func _on_WerkzeugPerson_mouse_exited():
	$Sprite/InfoBox.hide()


func initiate_scene(name):
	member_name = name
	initiated_member_scene = member_scene.instance()
	add_child(initiated_member_scene)
	initiated_member_scene.initiate(member_name)
	$Sprite.texture = load(initiated_member_scene.member_headshot_path)


func on_Area_entered(area):
	area_entered = true
	entered_task = area

func on_Area_exited(_area):
	area_entered = false
	entered_task = null

func task_dropped():
	if area_entered:
		var task_name = entered_task.task_name
		task_score = initiated_member_scene.dictionary[task_name]
