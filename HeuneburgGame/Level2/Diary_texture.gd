extends TextureRect

func _ready():
	$"../PageFlipAnim".hide()
	$"../PageFBackAnim".hide()
	

func _on_Button_Glossar_pressed():
	$"../PageFlip".play()
	$"../PageFBackAnim".show()
	$"../PageFBackAnim".play()
	$Button_Glossar/Label_titel1.show()
	$Button_Glossar/Label_titel1.show()
	$Button_Glossar/term1.show()
	$Button_Glossar/explanation1.show()
	$Button_Glossar/Button_nextPage1.show()
	$Diary_Intro_Title.hide()
	$Diary_Intro_Txt.hide()
	$Diary_Intro_Txt2.hide()
	$Diary_Intro_Txt3.hide()
	$achievement1.hide()
	$achievement2.hide()
	$achievement3.hide()
	$Button_Glossar/Button_nextPage1.show()
	
	

func _on_Button_nextPage1_pressed():
	$"../PageFlip_short".play()
	$"../PageFlipAnim".show()
	$"../PageFlipAnim".play()
	$Button_Glossar/Label_titel1.hide()
	$Button_Glossar/term1.hide()
	$Button_Glossar/explanation1.hide()
	$Glossar_p2.show()


func _on_Button_nextPage2_pressed():
	$"../PageFlip_short".play()
	$"../PageFlipAnim".show()
	$"../PageFlipAnim".play()
	$Glossar_p2/Label_titel2.hide()
	$Glossar_p2/term2.hide()
	$Glossar_p2/explanation2.hide()
	$Glossar_p3.show()
	$Glossar_p3/Label_titel3.show()
	$Glossar_p3/term3.show()
	$Glossar_p3/explanation3.show()


func _on_Button_nextPage3_pressed():
	$"../PageFlip_short".play()
	$"../PageFlipAnim".show()
	$"../PageFlipAnim".play()
	$Glossar_p3/Label_titel3.hide()
	$Glossar_p3/term3.hide()
	$Glossar_p3/explanation3.hide()
	$Glossar_p4.show()
	$Glossar_p4/Label_titel4.show()
	$Glossar_p4/term4.show()
	$Glossar_p4/explanation4.show()


func _on_Button_nextPage4_pressed():
	$"../PageFlip_short".play()
	$"../PageFlipAnim".show()
	$"../PageFlipAnim".play()
	$Glossar_p4/Label_titel4.hide()
	$Glossar_p4/term4.hide()
	$Glossar_p4/explanation4.hide()
	$Glossar_p5.show()
	$Glossar_p5/Label_titel5.show()
	$Glossar_p5/term5.show()
	$Glossar_p5/explanation5.show()


func _on_Button_prevPage5_pressed():
	$"../PageFlip_short".play()
	$"../PageFBackAnim".show()
	$"../PageFBackAnim".play()
	$Glossar_p5/Label_titel5.hide()
	$Glossar_p5/term5.hide()
	$Glossar_p5/explanation5.hide()
	$Glossar_p5.hide()
	$Glossar_p4.show()
	$Glossar_p4/Label_titel4.show()
	$Glossar_p4/term4.show()
	$Glossar_p4/explanation4.show()


func _on_Button_prevPage4_pressed():
	$"../PageFlip_short".play()
	$"../PageFBackAnim".show()
	$"../PageFBackAnim".play()
	$Glossar_p4/Label_titel4.hide()
	$Glossar_p4/term4.hide()
	$Glossar_p4/explanation4.hide()
	$Glossar_p4.hide()
	$Glossar_p3.show()
	$Glossar_p3/Label_titel3.show()
	$Glossar_p3/term3.show()
	$Glossar_p3/explanation3.show()


func _on_Button_prevPage2_pressed():
	$"../PageFlip_short".play()
	$"../PageFBackAnim".show()
	$"../PageFBackAnim".play()
	$Glossar_p2/Label_titel2.hide()
	$Glossar_p2/term2.hide()
	$Glossar_p2/explanation2.hide()
	$Glossar_p2.hide()
	$Button_Glossar/Label_titel1.show()
	$Button_Glossar/term1.show()
	$Button_Glossar/explanation1.show()


func _on_Button_prevPage3_pressed():
	$"../PageFlip_short".play()
	$"../PageFBackAnim".show()
	$"../PageFBackAnim".play()
	$Glossar_p3/Label_titel3.hide()
	$Glossar_p3/term3.hide()
	$Glossar_p3/explanation3.hide()
	$Glossar_p3.hide()
	$Glossar_p2/Label_titel2.show()
	$Glossar_p2/term2.show()
	$Glossar_p2/explanation2.show()


#back and forth page flip animations
func _on_PageFBackAnim_finished():
	$"../PageFBackAnim".hide()

func _on_PageFlipAnim_finished():
	$"../PageFlipAnim".hide()


func _on_Button_Close2_pressed():
	$"../BookClose".play()
	$"..".hide()
	$".".hide()
	$"../../FirstLevel_Image".show()
	$"../../Bauwagen_Overlay".show()
	$"../../Freilichtmuseum_Overlay".show()
	$"../../Grabungsstaette_Overlay".show()
	$"../../Keltenmuseum_Overlay".show()
	
	

func _on_Button_Close3_pressed():
	$"../BookClose".play()
	$"..".hide()
	$".".hide()
	$"../../FirstLevel_Image".show()
	$"../../Bauwagen_Overlay".show()
	$"../../Freilichtmuseum_Overlay".show()
	$"../../Grabungsstaette_Overlay".show()
	$"../../Keltenmuseum_Overlay".show()


func _on_Button_Close4_pressed():
	$"../BookClose".play()
	$"..".hide()
	$".".hide()
	$"../../FirstLevel_Image".show()
	$"../../Bauwagen_Overlay".show()
	$"../../Freilichtmuseum_Overlay".show()
	$"../../Grabungsstaette_Overlay".show()
	$"../../Keltenmuseum_Overlay".show()


func _on_Button_Close5_pressed():
	$"../BookClose".play()
	$"..".hide()
	$".".hide()
	$"../../FirstLevel_Image".show()
	$"../../Bauwagen_Overlay".show()
	$"../../Freilichtmuseum_Overlay".show()
	$"../../Grabungsstaette_Overlay".show()
	$"../../Keltenmuseum_Overlay".show()



func _on_Button_Journal_pressed():
	$"../PageFlip".play()
	$"../PageFlipAnim".show()
	$"../PageFlipAnim".play()
	$Button_Glossar/Label_titel1.hide()
	$Button_Glossar/term1.hide()
	$Button_Glossar/explanation1.hide()
	$Button_Glossar/Button_nextPage1.hide()
	$Diary_Intro_Title.show()
	$Diary_Intro_Txt.show()
	$Diary_Intro_Txt2.show()
	$Diary_Intro_Txt3.show()
	$achievement1.show()
	$achievement2.show()
	$achievement3.show()

