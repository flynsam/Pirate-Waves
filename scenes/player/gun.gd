extends Node2D

@export var cannonball_scene: PackedScene
@export var shoot_speed: float = 375.0

var cannon_sounds := [
	"res://assets/sfx/Cannon/cannon_1.mp3",
	"res://assets/sfx/Cannon/cannon_2.mp3",
	"res://assets/sfx/Cannon/cannon_3.mp3",
	"res://assets/sfx/Cannon/cannon_4.mp3",
	"res://assets/sfx/Cannon/cannon_5.mp3",
	"res://assets/sfx/Cannon/cannon_6.mp3",
]

func fire() -> void:
	$GunSprite.play()

	var path = cannon_sounds.pick_random()
	$Boom.stream = load(path)
	$Boom.play()

	await get_tree().create_timer(0.2).timeout

	var ball := cannonball_scene.instantiate()
	ball.global_position = $Muzzle.global_position
	ball.global_rotation = $Muzzle.global_rotation

	get_tree().current_scene.add_child(ball)
	ball.speed = shoot_speed
