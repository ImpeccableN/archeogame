extends Node2D

var team_members_array : Array
var which_team = 1

func _ready():
	if which_team == 1:
		get_team_members("res://Minigame_WerkzeugZuordnen/WerkzeugTeamMembers/Team1")
	elif which_team == 2:
		get_team_members("res://Minigame_WerkzeugZuordnen/WerkzeugTeamMembers/Team2")

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
