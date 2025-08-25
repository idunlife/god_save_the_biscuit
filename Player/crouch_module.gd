extends Node
class_name CrouchModule

@export var crouch_speed_modifier := 0.5

func apply_crouch(input_data: Dictionary, velocity: Vector2, delta: float, player: CharacterBody2D) -> Vector2:
	if input_data["down"] and player.is_on_floor():
		velocity.x *= crouch_speed_modifier

	if input_data["roll"]:
		print("Rolling triggered!")

	return velocity
