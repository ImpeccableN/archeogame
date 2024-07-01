extends Area2D

var member_name : String
var member_path = "res://CharacterScenes/"
var member_scene = preload("res://TeamMember.tscn")
var task_score = 0
var initiated_member_scene : Node
var area_entered = false


func _on_WerkzeugPerson_mouse_entered():
	$InfoBox.show()


func _on_WerkzeugPerson_mouse_exited():
	$InfoBox.hide()


func initiate_scene(name):
	member_name = name
	initiated_member_scene = member_scene.instance()
	add_child(initiated_member_scene)
	initiated_member_scene.initiate(member_name)
	$Sprite.texture = load(initiated_member_scene.member_headshot_path)
	$InfoBox.text = "Name: " + initiated_member_scene.dictionary.Name + "\nPro: " + initiated_member_scene.dictionary.Pro + "\nCon: " + initiated_member_scene.dictionary.Con


func on_Area_entered(area):
	var task_name = area.task_name
	task_score += initiated_member_scene.dictionary[task_name]
	print(member_name + "'s score:")
	print(task_score)


func on_Area_exited(area):
	var task_name = area.task_name
	task_score -= initiated_member_scene.dictionary[task_name]
	print(member_name + "'s score:")
	print(task_score)
