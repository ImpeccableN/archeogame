extends Node2D

var team_members_array : Array
var which_team = 1
var team_members_path = ""
var werkzeug_preload = preload("res://Minigame_WerkzeugZuordnen/Werkzeug.tscn")

func _ready():
	if which_team == 1:
		team_members_path = "res://Minigame_WerkzeugZuordnen/WerkzeugTeamMembers/Team1/"
	elif which_team == 2:
		team_members_path = "res://Minigame_WerkzeugZuordnen/WerkzeugTeamMembers/Team2/"
	get_team_members(team_members_path)
	load_in_team_members()
	load_in_werkzeuge()

func get_team_members(path):
	var dir = Directory.new()
	if dir.open(path) == OK:
		dir.list_dir_begin(true)
		var file_name = dir.get_next()
		
		while file_name != "":
			if dir.current_is_dir():
				pass
			elif file_name.get_extension() == "tscn":
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
		var member_split_array = member.split("_", false)
		member_split_array = member_split_array[1].split(".", false)
		var member_scene = load(team_members_path + member).instance()
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
