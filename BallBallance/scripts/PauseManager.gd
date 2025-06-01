extends Node3D

@onready var pause_menu = $PauseMenu
var game_paused : bool = false
@onready var restart_menu = $"../RestartManager/RestartMenu"

func  _process(_delta):
	if Input.is_action_just_pressed("ui_cancel") && !(restart_menu.visible):
		game_paused = !game_paused
	
	if game_paused:
		get_tree().paused = true
		pause_menu.show()
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	else:
		get_tree().paused = false
		pause_menu.hide()
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	
func _on_button_resume_pressed():
	Audio.button_sound_play()
	game_paused = !game_paused

func _on_button_settings_pressed():
	Audio.button_sound_play()
	pass

func _on_button_main_menu_pressed():
	Audio.button_sound_play()
	get_tree().paused = false
	get_tree().change_scene_to_file("res://menues/start_menu.tscn")
