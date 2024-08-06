extends Button

onready var popupPackage = $"../PackageConfirmation"

signal sendPackageNum(packageNum)

func _on_Button_DIY_pressed():
	$"../PNG_DIY".show()
	yield(get_tree().create_timer(4.0), "timeout")
	popupPackage.show()
	emit_signal("sendPackageNum", 1)
	


