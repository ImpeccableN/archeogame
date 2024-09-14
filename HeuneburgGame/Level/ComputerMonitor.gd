extends Node2D


#plays computer booting sound when scene is entered
func _ready():
	$CanvasLayer/Control_Application.hide()
	$Diary/PageFlipAnim.hide()
	$Diary/PageFBackAnim.hide()
	$PCBoot.play()


func _on_Button_Tip2_pressed():
	$PCMonitor/Tip2.show()
	yield(get_tree().create_timer(3.0), "timeout")
	$PCMonitor/Tip2.hide()



func _on_Button_Diary_pressed():
	$Diary.show()
	$Diary/Diary_texture.show()
	$PCMonitor.hide()
	$CanvasLayer.hide()
	$Diary/Diary_texture/Button_Glossar/Label_titel1.hide()
	$Diary/Diary_texture/Button_Glossar/term1.hide()
	$Diary/Diary_texture/Button_Glossar/explanation1.hide()
	$Diary/Diary_texture/Button_Glossar/Button_nextPage1.hide()
	

func _on_Button_Close_pressed():
	$Diary/BookClose.play()
	$Diary.hide()
	$Diary/Diary_texture.hide()
	$PCMonitor.show()
	$CanvasLayer.show()


func _on_Button_Glossar_pressed():
	$Diary/PageFlip.play()
	$Diary/PageFBackAnim.show()
	$Diary/PageFBackAnim.play()
	$Diary/Diary_texture/Button_Glossar/Label_titel1.show()
	$Diary/Diary_texture/Button_Glossar/term1.show()
	$Diary/Diary_texture/Button_Glossar/explanation1.show()
	$Diary/Diary_texture/Diary_Intro_Title.hide()
	$Diary/Diary_texture/Diary_Intro_Txt.hide()
	$Diary/Diary_texture/Button_Glossar/Button_nextPage1.show()
	
	

func _on_Close_explanation_pressed():
	$CanvasLayer/Control_Application.show()
	$Application_intro.hide()
	$Application_intro/Close_explanation.hide()


func _on_Button_nextPage1_pressed():
	$Diary/PageFlip_short.play()
	$Diary/PageFlipAnim.show()
	$Diary/PageFlipAnim.play()
	$Diary/Diary_texture/Button_Glossar/Label_titel1.hide()
	$Diary/Diary_texture/Button_Glossar/term1.hide()
	$Diary/Diary_texture/Button_Glossar/explanation1.hide()
	$Diary/Diary_texture/Glossar_p2.show()


func _on_Button_nextPage2_pressed():
	$Diary/PageFlip_short.play()
	$Diary/PageFlipAnim.show()
	$Diary/PageFlipAnim.play()
	$Diary/Diary_texture/Glossar_p2/Label_titel2.hide()
	$Diary/Diary_texture/Glossar_p2/term2.hide()
	$Diary/Diary_texture/Glossar_p2/explanation2.hide()
	$Diary/Diary_texture/Glossar_p3.show()
	$Diary/Diary_texture/Glossar_p3/Label_titel3.show()
	$Diary/Diary_texture/Glossar_p3/term3.show()
	$Diary/Diary_texture/Glossar_p3/explanation3.show()


func _on_Button_nextPage3_pressed():
	$Diary/PageFlip_short.play()
	$Diary/PageFlipAnim.show()
	$Diary/PageFlipAnim.play()
	$Diary/Diary_texture/Glossar_p3/Label_titel3.hide()
	$Diary/Diary_texture/Glossar_p3/term3.hide()
	$Diary/Diary_texture/Glossar_p3/explanation3.hide()
	$Diary/Glossar_p4.show()
	$Diary/Glossar_p4/Label_titel4.show()
	$Diary/Glossar_p4/term4.show()
	$Diary/Glossar_p4/explanation4.show()


func _on_Button_nextPage4_pressed():
	$Diary/PageFlip_short.play()
	$Diary/PageFlipAnim.show()
	$Diary/PageFlipAnim.play()
	$Diary/Glossar_p4/Label_titel4.hide()
	$Diary/Glossar_p4/term4.hide()
	$Diary/Glossar_p4/explanation4.hide()
	$Diary/Glossar_p5.show()
	$Diary/Glossar_p5/Label_titel5.show()
	$Diary/Glossar_p5/term5.show()
	$Diary/Glossar_p5/explanation5.show()


func _on_Button_prevPage5_pressed():
	$Diary/PageFlip_short.play()
	$Diary/PageFBackAnim.show()
	$Diary/PageFBackAnim.play()
	$Diary/Glossar_p5/Label_titel5.hide()
	$Diary/Glossar_p5/term5.hide()
	$Diary/Glossar_p5/explanation5.hide()
	$Diary/Glossar_p5.hide()
	$Diary/Glossar_p4.show()
	$Diary/Glossar_p4/Label_titel4.show()
	$Diary/Glossar_p4/term4.show()
	$Diary/Glossar_p4/explanation4.show()


func _on_Button_prevPage4_pressed():
	$Diary/PageFlip_short.play()
	$Diary/PageFBackAnim.show()
	$Diary/PageFBackAnim.play()
	$Diary/Glossar_p4/Label_titel4.hide()
	$Diary/Glossar_p4/term4.hide()
	$Diary/Glossar_p4/explanation4.hide()
	$Diary/Glossar_p4.hide()
	$Diary/Diary_texture/Glossar_p3.show()
	$Diary/Diary_texture/Glossar_p3/Label_titel3.show()
	$Diary/Diary_texture/Glossar_p3/term3.show()
	$Diary/Diary_texture/Glossar_p3/explanation3.show()


func _on_Button_prevPage2_pressed():
	$Diary/PageFlip_short.play()
	$Diary/PageFBackAnim.show()
	$Diary/PageFBackAnim.play()
	$Diary/Diary_texture/Glossar_p2/Label_titel2.hide()
	$Diary/Diary_texture/Glossar_p2/term2.hide()
	$Diary/Diary_texture/Glossar_p2/explanation2.hide()
	$Diary/Diary_texture/Glossar_p2.hide()
	$Diary/Diary_texture/Button_Glossar/Label_titel1.show()
	$Diary/Diary_texture/Button_Glossar/term1.show()
	$Diary/Diary_texture/Button_Glossar/explanation1.show()


func _on_Button_prevPage3_pressed():
	$Diary/PageFlip_short.play()
	$Diary/PageFBackAnim.show()
	$Diary/PageFBackAnim.play()
	$Diary/Diary_texture/Glossar_p3/Label_titel3.hide()
	$Diary/Diary_texture/Glossar_p3/term3.hide()
	$Diary/Diary_texture/Glossar_p3/explanation3.hide()
	$Diary/Diary_texture/Glossar_p3.hide()
	$Diary/Diary_texture/Glossar_p2/Label_titel2.show()
	$Diary/Diary_texture/Glossar_p2/term2.show()
	$Diary/Diary_texture/Glossar_p2/explanation2.show()


#back and forth page flip animations
func _on_PageFBackAnim_finished():
	$Diary/PageFBackAnim.hide()

func _on_PageFlipAnim_finished():
	$Diary/PageFlipAnim.hide()
	


func _on_Button_Close2_pressed():
	$Diary/BookClose.play()
	$Diary.hide()
	$Diary/Diary_texture.hide()
	$PCMonitor.show()
	$CanvasLayer.show()


func _on_Button_Close3_pressed():
	$Diary/BookClose.play()
	$Diary.hide()
	$Diary/Diary_texture.hide()
	$PCMonitor.show()
	$CanvasLayer.show()


func _on_Button_Close4_pressed():
	$Diary/BookClose.play()
	$Diary.hide()
	$Diary/Diary_texture.hide()
	$PCMonitor.show()
	$CanvasLayer.show()


func _on_Button_Close5_pressed():
	$Diary/BookClose.play()
	$Diary.hide()
	$Diary/Diary_texture.hide()
	$PCMonitor.show()
	$CanvasLayer.show()


func _on_Button_Journal_pressed():
	$Diary/PageFlip.play()
	$Diary/PageFlipAnim.show()
	$Diary/PageFlipAnim.play()
	$Diary/Diary_texture/Button_Glossar/Label_titel1.hide()
	$Diary/Diary_texture/Button_Glossar/term1.hide()
	$Diary/Diary_texture/Button_Glossar/explanation1.hide()
	$Diary/Diary_texture/Button_Glossar/Button_nextPage1.hide()
	$Diary/Diary_texture/Diary_Intro_Title.show()
	$Diary/Diary_texture/Diary_Intro_Txt.show()
