extends Node2D

onready var popupPackage = $PackageConfirmation
var packageNum : int

func _on_confirm_pressed():
	Global.packageSelect = packageNum
	popupPackage.show()
	$PackageConfirmation/Label.text = "You chose package " + str(Global.packageSelect) + ". " + "Have a good trip!"
	yield(get_tree().create_timer(4.0), "timeout")
	get_tree().change_scene("res://Level/TravelToHeuneburg.tscn")
	
	

func _on_decline_pressed():
	get_tree().change_scene("res://Level/PackageSelection.tscn")
	packageNum = 0


func _on_Button_DIY_sendPackageNum(pNum):
	packageNum = pNum
	Global.disasterScore += 30
	print(Global.disasterScore)
	
func _on_Button_GLAM_sendPackageNum(pNum):
	packageNum = pNum
	Global.disasterScore += 15
	print(Global.disasterScore)

func _on_Button_Serious_sendPackageNum(pNum):
	packageNum = pNum
	Global.disasterScore += 0
	print(Global.disasterScore)
