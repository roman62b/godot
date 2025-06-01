extends Node3D

@onready var restart_menu = $RestartMenu

func _ready():
	restart_menu.hide()

func _process(_delta):
	if restart_menu.visible:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _on_area_3d_body_entered(body):
	if body.name == "ball":
		restart_menu.show()

func _on_button_again_pressed():
	Audio.button_sound_play()
	restart_menu.hide()
	get_tree().reload_current_scene()

func _on_button_main_menu_pressed():
	Audio.button_sound_play()
	restart_menu.hide()
	get_tree().change_scene_to_file("res://menues/start_menu.tscn")
