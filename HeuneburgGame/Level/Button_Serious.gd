extends Button

onready var popupPackage = $"../PackageConfirmation"

signal sendPackageNum(packageNum)

func _on_Button_Serious_pressed():
	$"../PNG_Serious".show()
	yield(get_tree().create_timer(4.0), "timeout")
	popupPackage.show()
	emit_signal("sendPackageNum", 3)


