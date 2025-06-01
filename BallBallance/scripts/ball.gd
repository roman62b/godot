extends RigidBody3D

@export_category("Ball")
@export var power : float = 0.1
@export var jump_pover : float = 3

@onready var ray = $RayCast3D

@onready var impulse = Vector3()

func _physics_process(_delta):
	ray.global_rotation_degrees = Vector3(0, 0, 0)
	ray.global_position = global_position
	
	impulse = Vector3()
	
	if Input.is_action_pressed("left"):
		impulse.x = -power
	elif Input.is_action_pressed("right"):
		impulse.x = power
	if Input.is_action_pressed("front"):
		impulse.z = -power
	elif Input.is_action_pressed("back"):
		impulse.z = power
	
	if ray.is_colliding():
		if Input.is_action_just_pressed("jump"):
			impulse.y = jump_pover

	if impulse:
		apply_central_impulse(impulse)

func _on_area_3d_body_entered(_body):
	Audio.ball_sound_play()
