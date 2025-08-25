extends Node
class_name DashModule

@export var dash_speed := 600.0
@export var dash_time := 0.15
@export var dash_cooldown := 0.25
@export var max_air_dashes := 1 

var dashing := false
var dash_timer := 0.0
var cooldown_timer := 0.0
var dash_vector := Vector2.ZERO
var facing_direction := Vector2.RIGHT
var air_dashes_left := 0

func apply_dash(input_data: Dictionary, velocity: Vector2, delta: float, player: CharacterBody2D) -> Vector2:
	if player.is_on_floor():
		air_dashes_left = max_air_dashes
	
	# Handle cooldown
	if cooldown_timer > 0:
		cooldown_timer -= delta

	# Continue dash
	if dashing:
		dash_timer -= delta
		if dash_timer <= 0:
			dashing = false
			cooldown_timer = dash_cooldown
			return velocity
		# lock velocity so gravity doesn't add in
		return dash_vector

	# Update facing direction on any input press
	if input_data["left"]:
		facing_direction = Vector2.LEFT
	elif input_data["right"]:
		facing_direction = Vector2.RIGHT

	# Start dash
	if input_data["dash"] and cooldown_timer <= 0:
		if player.is_on_floor() or air_dashes_left > 0:
			var dir = Vector2(int(input_data["right"]) - int(input_data["left"]),
				int(input_data["down"]) - int(input_data["up"]) )

		# fallback → use facing
			if dir == Vector2.ZERO:
				dir = facing_direction

			# soften vertical dashes
			if abs(dir.y) > 0.7 or abs(dir.x) < 0.3:
				dir.y = sign(dir.y) * 0.3  

		# if only vertical, fallback to facing
			if abs(dir.y) != 0 and abs(dir.x) == 0:
				dir = facing_direction

			dir = dir.normalized()

		# lock dash vector once
			dash_vector = dir * dash_speed
			dashing = true
			dash_timer = dash_time

			if !player.is_on_floor():
				air_dashes_left -= 1

			return dash_vector

	return velocity
