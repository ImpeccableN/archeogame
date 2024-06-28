extends Node

var member_name = ""
var image_folder_path = "res://graphics/Characters/"
var member_headshot_path = ""
var member_fullcard_path = ""
var member_fullcard_bw_path = ""
var dictionary : Dictionary

#more properties to come

func _ready():
	initiate("Kilian")
	load_json_data()

func initiate(name):
	member_name = name
	member_headshot_path = image_folder_path + "Headshots/" + member_name + ".png"
	member_fullcard_path = image_folder_path + "FullCards/" + member_name + ".png"
	member_fullcard_bw_path = image_folder_path + "FullCards/" + member_name + "_bw.png"


func load_json_data():
# Retrieve data, Work in Progress
	var file = File.new()
	file.open("res://Data/teamMemberData.json", File.READ)
	var content = file.get_as_text()
	file.close()
	var json_parse = JSON.parse(content)
	if json_parse.error == OK:
		if typeof(json_parse.result) == TYPE_ARRAY:
			var parse_array = json_parse.result
			for result in parse_array:
				if result.Name == member_name:
					dictionary = result
	else:
		print("Error")
	
