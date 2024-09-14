extends Label

var typingText : float

func _ready():
	$"../Scribble".play()
	percent_visible = 0.0
	typingText = 14.0 / text.length()
	$Timer.start()
	

func _on_Timer_timeout():
	percent_visible += typingText
	if percent_visible >= 1.0:
		$"../Scribble".stop()
		$Timer.stop()
