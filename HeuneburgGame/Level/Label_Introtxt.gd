extends Label

var typingText : float

func _ready():
	percent_visible = 0.0
	typingText = 12.0 / text.length()
	$Timer.start()
	

func _on_Timer_timeout():
	percent_visible += typingText
	if percent_visible >= 1.0:
		$Timer.stop()
