extends Button

onready var Button_confirm = $"../confirm"
onready var Button_decline = $"../decline"

signal sendPackageNum(packageNum)

func _on_Button_Serious_pressed():
	$"../PNG_Serious".show()
	Button_confirm.show()
	Button_decline.show()
	emit_signal("sendPackageNum", 3)


