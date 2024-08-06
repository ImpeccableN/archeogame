extends Button

onready var popupPackage = $"../PackageConfirmation"

signal sendPackageNum(packageNum)

func _on_Button_GLAM_pressed():
	$"../PNG_GLAM".show()
	yield(get_tree().create_timer(4.0), "timeout")
	popupPackage.show()
	emit_signal("sendPackageNum", 2)

