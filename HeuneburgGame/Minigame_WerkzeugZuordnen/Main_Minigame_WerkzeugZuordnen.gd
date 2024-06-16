extends Node2D

var team_members_array : Array
var which_team = 1
var team_members_path = ""

func _ready():
	if which_team == 1:
		team_members_path = "res://Minigame_WerkzeugZuordnen/WerkzeugTeamMembers/Team1/"
	elif which_team == 2:
		team_members_path = "res://Minigame_WerkzeugZuordnen/WerkzeugTeamMembers/Team2/"
	get_team_members(team_members_path)
	load_in_team_members()

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

func load_in_team_members():
	var positions = $Teampositions.get_children()
	var i = 0
	for member in team_members_array:
		var member_scene = load(team_members_path + member)
		var member_scene_instance = member_scene.instance()
		add_child(member_scene_instance)
		member_scene_instance.position = positions[i].position
		i += 1
	
