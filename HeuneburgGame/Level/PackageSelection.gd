extends Node2D

onready var popupPackage = $"../PackageConfirmation"
var packageNum : int

func _on_confirm_pressed():
	Global.packageSelect = packageNum
	$PackageConfirmation.hide()
	get_tree().change_scene("res://Level/TravelToHeuneburg.tscn")
	

func _on_Button_sendPackageNum(pNum):
	packageNum = pNum


func _on_decline_pressed():
	get_tree().change_scene("res://Level/PackageSelection.tscn")
	packageNum = 0

