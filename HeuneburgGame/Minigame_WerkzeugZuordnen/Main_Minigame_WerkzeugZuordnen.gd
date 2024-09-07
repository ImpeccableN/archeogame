extends Node2D


var team_names_array : Array
var team_scenes_array : Array
var which_team : int = 0
var team_members_path = ""
var werkzeug_preload = preload("res://Minigame_WerkzeugZuordnen/Werkzeug.tscn")
var werkzeug_person_scene = preload("res://Minigame_WerkzeugZuordnen/WerkzeugPerson.tscn")
var score : int
var json_array : Array
var tutorial_text = ""


func _ready():
	which_team = Global.teamSelect
	if which_team == 0:
		which_team = 1
	if which_team == 1:
		team_members_path = "res://graphics/Characters/FullCards/Team1/"
	elif which_team == 2:
		team_members_path = "res://graphics/Characters/FullCards/Team2/"
	elif which_team == 3:
		team_members_path = "res://graphics/Characters/FullCards/Team3/"
	get_team_members(team_members_path)
	load_in_team_members()
	load_in_werkzeuge()
	$InfoScreen.show()
	$InfoScreen.raise()


func get_team_members(path):
	var dir = Directory.new()
	if dir.open(path) == OK:
		dir.list_dir_begin(true)
		var file_name = dir.get_next()
		
		while file_name != "":
			if "_bw" in file_name:
				pass
			elif file_name.get_extension() == "import":
				var file = file_name.replace(".import", "")
				team_names_array.append(file_name)
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")
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
		member_scene.connect("show_memberinfo", self, "show_text")
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
		var werkzeug_control_node = werkzeug_instance.get_child(2)
		werkzeug_control_node.connect("gui_input", self, "open_infoscreen", [werkzeug_instance])


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
		if member.task_score != 0:
			score += member.task_score
		else:
			show_text(member.member_name + " does not have a task. Abort.")
			score = 0
			return
	show_text(get_score_message())
	$InfoScreen/LeaveButton.show()
	Global.minigame_werkzeuge_done = true


func open_infoscreen(event, node):
	if event.is_action("right_click"):
		show_text(node.dictionary.Task + "\n" + node.dictionary.Info)


func _on_InfoScreen_gui_input(event):
	if event.is_action("click_button"):
		$InfoScreen.hide()
		$InfoScreen.mouse_filter = Control.MOUSE_FILTER_IGNORE


func show_text(text):
	$InfoScreen.raise()
	$InfoScreen.show()
	$InfoScreen.mouse_filter = Control.MOUSE_FILTER_PASS
	$InfoScreen/InfoLabel.text = text


func get_score_message():
	match score:
		3, 4, 5:
			Global.calculate_disaster(30)
			return "Needs improvement. Pay more attention to your team's strengths and weaknesses."
		6, 7, 8:
			Global.calculate_disaster(20)
			return "Not bad, but you can do better. Not during this excavation though."
		9, 10, 11:
			Global.calculate_disaster(10)
			return "Good effort! You’re on the right track, but there's room for improvement."
		12, 13, 14:
			Global.calculate_disaster(5)
			return "Great job! Your leadership skills are impressive."
		15, 16, 17, 18:
			Global.calculate_disaster(0)
			return "Perfect, you are a super supervisor!!!"




func _on_Button_Diary_pressed():
	$Diary.show()
	$Diary/Diary_texture.show()
	$Background.hide()
	$Button.hide()


func _on_Button_Close_pressed():
	$Diary.hide()
	$Diary/Diary_texture.hide()
	$Background.show()
	$Button.show()


func _on_LeaveButton_pressed():
	get_tree().change_scene("res://Level1/FirstLevel_Map.tscn")
