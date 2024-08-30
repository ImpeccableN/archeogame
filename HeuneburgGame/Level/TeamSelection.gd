extends Node2D


var teamNumb : int

func _ready():
	pass

#1. Button Wert übergeben und hier übergeben

func _on_confirm_pressed():
	Global.teamSelect = teamNumb
	$UserTeamConfirmation.hide()
	$Label.text = "You chose Team " + str(Global.teamSelect) + ". \nHave fun on your journey."
	yield(get_tree().create_timer(3.0), "timeout")
	get_tree().change_scene("res://Level/PackageSelection.tscn")


func _on_Button_sendTeamNumb(numb):
	teamNumb = numb


func _on_decline_pressed():
	$UserTeamConfirmation.hide()
	teamNumb = 0




func _on_Button_Close_pressed():
	$Diary.hide()
	$Diary/Diary_texture.hide()
	$ScrollContainer_Team1.show()
	$ScrollContainer_Team2.show()
	$ScrollContainer_Team3.show()
	$Button_Team1.show()
	$Button_Team2.show()
	$Button_Team3.show()
	$Label.show()


func _on_Button_Diary_pressed():
	$Diary.show()
	$Diary/Diary_texture.show()
	$ScrollContainer_Team1.hide()
	$ScrollContainer_Team2.hide()
	$ScrollContainer_Team3.hide()
	$Button_Team1.hide()
	$Button_Team2.hide()
	$Button_Team3.hide()
	$Label.hide()
