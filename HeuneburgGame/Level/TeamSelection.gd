extends Node2D

onready var teamSelectT1 = "res://Level/Global.gd"
onready var teamSelectT2 = "res://Level/Global.gd"
onready var teamSelectT3 = "res://Level/Global.gd"

func _ready():
	pass

#1. Button Wert übergeben und hier übergeben

func _on_confirm_pressed():
	if teamSelectT1:
#		teamSelectT1.save()
		print("Team1 chosen!")

	elif teamSelectT2:
#		teamSelectT2.save()
		print("Team2 chosen!")
	
	elif teamSelectT3:
#		teamSelectT3.save()
		print("Team3 chosen!")
