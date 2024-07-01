extends Node2D

var team_names_array : Array
var team_scenes_array : Array
var which_team = 1
var team_members_path = ""
var werkzeug_preload = preload("res://Minigame_WerkzeugZuordnen/Werkzeug.tscn")
var werkzeug_person_scene = preload("res://Minigame_WerkzeugZuordnen/WerkzeugPerson.tscn")
var score : int
var json_array : Array


func _ready():
	if which_team == 1:
		team_members_path = "res://graphics/Characters/FullCards/Team1/"
	elif which_team == 2:
		team_members_path = "res://graphics/Characters/FullCards/Team2/"
	elif which_team == 3:
		team_members_path = "res://graphics/Characters/FullCards/Team3/"
	get_team_members(team_members_path)
	load_in_team_members()
	load_in_werkzeuge()


func get_team_members(path):
	var dir = Directory.new()
	if dir.open(path) == OK:
		dir.list_dir_begin(true)
		var file_name = dir.get_next()
		
		while file_name != "":
			if "_bw" in file_name:
				pass
			elif file_name.get_extension() == "png":
				team_names_array.append(file_name)
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")
#	print(team_names_array)
	dir.list_dir_end()


func load_in_team_members():
	var positions = $Teampositions.get_children()
	var i = 0
	for member in team_names_array:
		var member_split_array = member.split(".", false)
		var member_scene = werkzeug_person_scene.instance()
		add_child(member_scene)
		team_scenes_array.append(member_scene)
		print("Member name: " + member_split_array[0])
		member_scene.initiate_scene(member_split_array[0])
		member_scene.position = positions[i].position
		member_scene.scale = Vector2(0.75, 0.75)
		i += 1


func load_in_werkzeuge():
	load_json_data()
	var positions = $WerkzeugPositions.get_children()
	
	for n in 6:
		var task_name = json_array[n].Task
		var werkzeug_instance = werkzeug_preload.instance()
		add_child(werkzeug_instance)
		werkzeug_instance.initiate(task_name)
		werkzeug_instance.position = positions[n].position
		for member in team_scenes_array:
			werkzeug_instance.connect("icon_dropped", member, "task_dropped")


func load_json_data():
# Retrieve data
	var file = File.new()
	file.open("res://Data/aufgabenData.json", File.READ)
	var content = file.get_as_text()
	file.close()
	var json_parse = JSON.parse(content)
	if json_parse.error == OK:
		if typeof(json_parse.result) == TYPE_ARRAY:
			json_array = json_parse.result
	else:
		print("FatalError")

func _on_Button_pressed():
	for member in team_scenes_array:
		if member.entered_task != null:
			score += member.task_score
		else:
			print(member.member_name + " does not have a task. Abort.")
			return
	print(score)
