extends Node2D

var teamNumb : int

func _ready():
	pass

#1. Button Wert übergeben und hier übergeben

func _on_confirm_pressed():
	Global.teamSelect = teamNumb
	print("Team " + str(Global.teamSelect) + " chosen")
#	if teamSelectT1:
##		teamSelectT1.save()
#		print("Team1 chosen!")
#
#	elif teamSelectT2:
##		teamSelectT2.save()
#		print("Team2 chosen!")
#
#	elif teamSelectT3:
##		teamSelectT3.save()
#		print("Team3 chosen!")




func _on_Button_sendTeamNumb(numb):
	teamNumb = numb


func _on_decline_pressed():
	$UserTeamConfirmation.hide()
	teamNumb = 0
