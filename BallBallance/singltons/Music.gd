extends Node

@export var music : bool = true
@onready var player = $AudioStreamPlayer
@onready var sound
@onready var i : int

func _ready():
	player.set_bus("Music")
	music_play()

func music_change():
	i = randi_range(2, 5)
	match i:
		1:
			sound = load("res://soundtreacks/mixkit-random.mp3")
			#player.volume_db = ?
		2:
			sound = load("res://soundtreacks/mixkit-ambient.mp3")
			#player.volume_db = ?
		3:
			sound = load("res://soundtreacks/mixkit-fhloston-paradise-arrival.mp3")
			#player.volume_db = ?
		4:
			sound = load("res://soundtreacks/mixkit-1980.mp3")
			#player.volume_db = ?
		5:
			sound = load("res://soundtreacks/mixkit-relax-beat.mp3")
			#player.volume_db = ?

func music_play():
	if music:
		music_change()
		player.stream = sound
		player.play()

func _on_audio_stream_player_finished():
	music_play()
