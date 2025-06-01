extends Area3D

func _on_body_entered(body) -> void:
	if body.name == "ball":
		get_tree().change_scene_to_file("res://levels/level_2.tscn")
