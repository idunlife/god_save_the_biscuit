extends Node
class_name WallModule

@export var wall_slide_speed := 50.0
@export var wall_jump_force := Vector2(-300, -400)

func apply_wall_actions(input_data: Dictionary, velocity: Vector2, delta: float, player: CharacterBody2D) -> Vector2:
	if player.is_on_wall() and not player.is_on_floor():
		# Wall sliding
		if velocity.y > wall_slide_speed:
			velocity.y = wall_slide_speed

		# Wall jump
		if input_data["jump"]:
			var dir := -1 if input_data["move"].x > 0 else 1
			velocity = wall_jump_force * Vector2(dir, 1)

	return velocity
	
