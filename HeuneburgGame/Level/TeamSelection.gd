extends Node2D

var teamNumb : int

func _ready():
	pass

#1. Button Wert übergeben und hier übergeben

func _on_confirm_pressed():
	Global.teamSelect = teamNumb
	$UserTeamConfirmation.hide()
	$Label.text = "You chose Team " + str(Global.teamSelect) + ". \nHave fun on your journey."
	yield(get_tree().create_timer(5.0), "timeout")
	get_tree().change_scene("res://Level/PackageSelection.tscn")


func _on_Button_sendTeamNumb(numb):
	teamNumb = numb


func _on_decline_pressed():
	$UserTeamConfirmation.hide()
	teamNumb = 0


