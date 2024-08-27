extends Node2D

onready var popupPackage = $PackageConfirmation
var packageNum : int

func _ready():
	pass

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
	
func _on_Button_GLAM_sendPackageNum(pNum):
	packageNum = pNum
	Global.disasterScore += 15

func _on_Button_Serious_sendPackageNum(pNum):
	packageNum = pNum
	Global.disasterScore += 0




func _on_Button_Diary_pressed():
	$Diary.show()
	$Diary/Diary_texture.show()
	$Background.hide()
	$Button_DIY.hide()
	$Button_GLAM.hide()
	$Button_Serious.hide()
	$PNG_DIY.hide()
	$PNG_GLAM.hide()
	$PNG_Serious.hide()



func _on_Button_Close_pressed():
	$Diary.hide()
	$Diary/Diary_texture.hide()
	$Background.show()
	$Button_DIY.show()
	$Button_GLAM.show()
	$Button_Serious.show()
	$confirm.hide()
	$decline.hide()
