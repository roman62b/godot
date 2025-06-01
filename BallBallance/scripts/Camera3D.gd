extends Camera3D

@onready var ball = $"../ball"

func _physics_process(_delta):
	var pos = transform.origin.lerp(ball.transform.origin + Vector3(-0.5, 1.5, 2), 0.05)
	look_at_from_position(pos, ball.transform.origin, Vector3.UP)
