extends Node2D

var team_members_array : Array
var which_team = 3
var team_members_path = ""
var werkzeug_preload = preload("res://Minigame_WerkzeugZuordnen/Werkzeug.tscn")
var werkzeug_person_scene = preload("res://Minigame_WerkzeugZuordnen/WerkzeugPerson.tscn")

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
				team_members_array.append(file_name)
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")
	print(team_members_array)
	dir.list_dir_end()

func load_in_team_members():
	var positions = $Teampositions.get_children()
	var i = 0
	for member in team_members_array:
		var member_split_array = member.split(".", false)
#		member_split_array = member_split_array[1].split(".", false)
		var member_scene = werkzeug_person_scene.instance()
		add_child(member_scene)
		print(member_split_array[0])
		member_scene.initiate_scene(member_split_array[0])
		member_scene.position = positions[i].position
		member_scene.scale = Vector2(0.75, 0.75)
		i += 1
	

func load_in_werkzeuge():
	var werkzeug_instance = werkzeug_preload.instance()
	add_child(werkzeug_instance)
	werkzeug_instance.position = $WerkzeugPosition.position
