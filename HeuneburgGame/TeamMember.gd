extends Node

export var member_name = ""
export var image_folder_path = ""
var member_headshot_path = ""
var member_fullcard_path = ""
var member_fullcard_bw_path = ""

#more properties to come

func _ready():
	member_headshot_path = image_folder_path + "Headshots/" + member_name + ".png"
	member_fullcard_path = image_folder_path + "FullCards/" + member_name + ".png"
	member_fullcard_bw_path = image_folder_path + "FullCards/" + member_name + "_bw.png"


