extends Node

var member_name = ""
var image_folder_path = "res://graphics/Characters/"
var member_headshot_path = ""
var member_fullcard_path = ""
var member_fullcard_bw_path = ""

#more properties to come

func _ready():
	pass
#	member_headshot_path = image_folder_path + "Headshots/" + member_name + ".png"
#	member_fullcard_path = image_folder_path + "FullCards/" + member_name + ".png"
#	member_fullcard_bw_path = image_folder_path + "FullCards/" + member_name + "_bw.png"

func initiate(name):
	member_name = name
	member_headshot_path = image_folder_path + "Headshots/" + member_name + ".png"
	member_fullcard_path = image_folder_path + "FullCards/" + member_name + ".png"
	member_fullcard_bw_path = image_folder_path + "FullCards/" + member_name + "_bw.png"
