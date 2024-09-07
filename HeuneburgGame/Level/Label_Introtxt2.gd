extends Label

var typingText : float

func _ready():
	percent_visible = 0.0
	typingText = 12.0 / text.length()
#	yield(get_tree().create_timer(20.0), "timeout")
	$Timer.start()


func _on_Timer_timeout():
	percent_visible += typingText
	if percent_visible >= 1.0:
		$Timer.stop()
		$"../Button_nextPage".show()
