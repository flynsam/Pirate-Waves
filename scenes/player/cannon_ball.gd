extends Node2D

@export var speed: float = 375.0

func _physics_process(delta):
	# Move forward relative to rotation
	position += Vector2.RIGHT.rotated(global_rotation) * speed * delta
 
