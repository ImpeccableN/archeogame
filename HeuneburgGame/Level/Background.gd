extends TextureRect

onready var Button_confirm = $"../confirm"
onready var Button_decline = $"../decline"


func _ready():
	Button_confirm.hide()
	Button_decline.hide()


