extends Area2D

var member_name : String
var member_path = "res://CharacterScenes/"
var member_scene = preload("res://TeamMember.tscn")
var task_score = 0
var initiated_member_scene : Node
var area_entered = false
var mouse_entered = false
var infotext : String
var audio_array : Array

onready var audio = get_node("AudioConfirm")

signal show_memberinfo(text)


func _on_WerkzeugPerson_mouse_entered():
#	$InfoBox.show()
	mouse_entered = true


func _on_WerkzeugPerson_mouse_exited():
#	$InfoBox.hide()
	mouse_entered = false


func _input(event):
	if mouse_entered and Input.is_mouse_button_pressed(2):
		emit_signal ("show_memberinfo", infotext)


func initiate_scene(name):
	member_name = name
	initiated_member_scene = member_scene.instance()
	add_child(initiated_member_scene)
	initiated_member_scene.initiate(member_name)
	$Sprite.texture = load(initiated_member_scene.member_headshot_path)
	infotext = "Name: " + initiated_member_scene.dictionary.Name + "\nPro: " + initiated_member_scene.dictionary.Pro + "\nCon: " + initiated_member_scene.dictionary.Con
	$InfoBox.raise()
	load_audio_array()


func on_Area_entered(area):
	var task_name = area.task_name
	task_score += initiated_member_scene.dictionary[task_name]
	audio_array.shuffle()
	audio.stream = load("res://Minigame_WerkzeugZuordnen/Assets/Sounds/TeamSounds/" + audio_array[0])
	audio.play()
	print(member_name + "'s score:")
	print(task_score)


func on_Area_exited(area):
	var task_name = area.task_name
	task_score -= initiated_member_scene.dictionary[task_name]
	print(member_name + "'s score:")
	print(task_score)


func load_audio_array():
	var gender = initiated_member_scene.dictionary.Gender
	var dir = Directory.new()
	if dir.open("res://Minigame_WerkzeugZuordnen/Assets/Sounds/TeamSounds/") == OK:
		dir.list_dir_begin(true)
		var file_name = dir.get_next()
		
		while file_name != "":
#			if "import" in file_name:
#				pass
			if gender in file_name and "import" in file_name:
				print(file_name)
				file_name = file_name.replace(".import", "")
				print(file_name)
				audio_array.append(file_name)
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")
	dir.list_dir_end()
