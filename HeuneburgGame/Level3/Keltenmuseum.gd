extends Node2D

onready var reiter_img = $Reiter_texture
onready var vase_img = $"Kegelhalsgefäß_texture"
onready var krieger_img = $Krieger_texture
onready var heuneburgmodell_img = $"Geländemodell_texture"
onready var gewandnadel_img = $Gewandnadel_texture
onready var spinnwirtel_img = $Spinnwirtel_texture
onready var schmuckperle_img = $Schmuckperle_texture
onready var pferdemaske_img = $Pferdemaske_texture
onready var gemaelde_img = $HerrderTiere_texture
export var images_grow_scale := Vector2.ZERO




func _on_Button_Reiter_mouse_entered():
	reiter_img.rect_scale = images_grow_scale

func _on_Button_Reiter_mouse_exited():
	reiter_img.rect_scale = Vector2.ONE



func _on_Button_Vase_mouse_entered():
	vase_img.rect_scale = images_grow_scale

func _on_Button_Vase_mouse_exited():
	vase_img.rect_scale = Vector2.ONE



func _on_Button_Skulptur_mouse_entered():
	krieger_img.rect_scale = images_grow_scale

func _on_Button_Skulptur_mouse_exited():
	krieger_img.rect_scale = Vector2.ONE



func _on_Button_Gelndemodell_mouse_entered():
	heuneburgmodell_img.rect_scale = images_grow_scale

func _on_Button_Gelndemodell_mouse_exited():
	heuneburgmodell_img.rect_scale = Vector2.ONE



func _on_Button_Gewandnadel_mouse_entered():
	gewandnadel_img.rect_scale = images_grow_scale

func _on_Button_Gewandnadel_mouse_exited():
	gewandnadel_img.rect_scale = Vector2.ONE



func _on_Button_Spinnwirtel_mouse_entered():
	spinnwirtel_img.rect_scale = images_grow_scale

func _on_Button_Spinnwirtel_mouse_exited():
	spinnwirtel_img.rect_scale = Vector2.ONE



func _on_Button_Perle_mouse_entered():
	schmuckperle_img.rect_scale = images_grow_scale

func _on_Button_Perle_mouse_exited():
	schmuckperle_img.rect_scale = Vector2.ONE



func _on_Button_Pferdemaske_mouse_entered():
	pferdemaske_img.rect_scale = images_grow_scale

func _on_Button_Pferdemaske_mouse_exited():
	pferdemaske_img.rect_scale = Vector2.ONE



func _on_Button_Gemlde_mouse_entered():
	gemaelde_img.rect_scale = images_grow_scale

func _on_Button_Gemlde_mouse_exited():
	gemaelde_img.rect_scale = Vector2.ONE



func _on_Button_Leave_pressed():
	get_tree().change_scene("res://Level3/ThirdDay_Map.tscn")


func _on_Button_Diary_pressed():
	$Diary.show()
	$Diary/Diary_texture.show()
	$Museum_inside.hide()
	$Reiter_texture.hide()
	$"Kegelhalsgefäß_texture".hide()
	$Krieger_texture.hide()
	$Sofa1_texture.hide()
	$"Geländemodell_texture".hide()
	$Gewandnadel_texture.hide()
	$Sofa2_texture.hide()
	$Spinnwirtel_texture.hide()
	$sockel1_texture.hide()
	$sockel2_texture.hide()
	$Schmuckperle_texture.hide()
	$sockel3_texture.hide()
	$Pferdemaske_texture.hide()
	$sockel4_texture.hide()
	$HerrderTiere_texture.hide()

func _on_Button_Close_pressed():
	$Diary/BookClose.play()
	$Diary.hide()
	$Diary/Diary_texture.hide()
	$Museum_inside.show()
	$Reiter_texture.show()
	$"Kegelhalsgefäß_texture".show()
	$Krieger_texture.show()
	$Sofa1_texture.show()
	$"Geländemodell_texture".show()
	$Gewandnadel_texture.show()
	$Sofa2_texture.show()
	$Spinnwirtel_texture.show()
	$sockel1_texture.show()
	$sockel2_texture.show()
	$Schmuckperle_texture.show()
	$sockel3_texture.show()
	$Pferdemaske_texture.show()
	$sockel4_texture.show()
	$HerrderTiere_texture.show()


func _on_Button_BacktoMain_pressed():
	get_tree().change_scene("res://MainMenu.tscn")


func _on_Button_Quit_pressed():
	get_tree().quit()
