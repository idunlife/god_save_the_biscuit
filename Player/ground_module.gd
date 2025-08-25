extends Node
class_name GroundPoundModule

@export var slam_force := 800.0
@export var pause_time := 0.2
var slamming := false

func apply_ground_pound(input_data: Dictionary, velocity: Vector2, delta: float, player: CharacterBody2D) -> Vector2:
	if input_data["down"] and not player.is_on_floor() and not slamming:
		slamming = true
		velocity = Vector2(0, slam_force)

	if player.is_on_floor():
		slamming = false

	return velocity
