extends Node

const SOUND_BUTTON = preload("res://music/knopka-vyiklyucheniya-na-nastolnoy-lampe1.ogg")
const SOUND_BAll = preload("res://music/true-ball_hUxgWQ49.mp3")

@onready var player = $AudioStreamPlayer


func button_sound_play():
	player.set_bus("Button")
	player.stream = SOUND_BUTTON
	player.volume_db = 0
	player.pitch_scale = 1
	player.play()

func ball_sound_play():
	player.set_bus("Ball")
	player.stream = SOUND_BAll
	player.volume_db = -10
	player.pitch_scale = 1 - randf_range(-0.1, 0.1)
	player.play()
