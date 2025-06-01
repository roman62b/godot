extends Control

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_button_play_pressed():
	Audio.button_sound_play()
	get_tree().change_scene_to_file("res://levels/level_1.tscn")

func _on_button_settings_pressed():
	Audio.button_sound_play()
	pass

func _on_button_exit_pressed():
	Audio.button_sound_play()
	get_tree().quit()
