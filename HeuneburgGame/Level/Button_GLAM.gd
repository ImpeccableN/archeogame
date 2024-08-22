extends Button

onready var Button_confirm = $"../confirm"
onready var Button_decline = $"../decline"

signal sendPackageNum(packageNum)

func _on_Button_GLAM_pressed():
	$"../PNG_GLAM".show()
	Button_confirm.show()
	Button_decline.show()
	emit_signal("sendPackageNum", 2)

