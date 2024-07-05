extends Node2D

var teamNumb : int

func _ready():
	pass

#1. Button Wert übergeben und hier übergeben

func _on_confirm_pressed():
	Global.teamSelect = teamNumb


func _on_Button_sendTeamNumb(numb):
	teamNumb = numb


func _on_decline_pressed():
	$UserTeamConfirmation.hide()
	teamNumb = 0
