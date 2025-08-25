extends Node
class_name MovementModule

@export var speed := 200.0
@export var jump_force := -400.0
@export var gravity := 900.0
@export var terminal_velocity := 500.0
@export var coyote_time := 0.2
@export var jump_buffer := 0.2

var coyote_timer := 0.0
var buffer_timer := 0.0

func calculate_velocity(input_data: Dictionary, velocity: Vector2, delta: float) -> Vector2:
	var v := velocity

	# Horizontal move
	v.x = input_data["move"].x * speed

	# Gravity
	if not get_parent().is_on_floor():
		v.y = min(v.y + gravity * delta, terminal_velocity)
	else:
		coyote_timer = coyote_time

	# Jump buffering
	if input_data["jump"]:
		buffer_timer = jump_buffer

	if (buffer_timer > 0 and (get_parent().is_on_floor() or coyote_timer > 0)):
		v.y = jump_force
		buffer_timer = 0
		coyote_timer = 0

	if coyote_timer > 0:
		coyote_timer -= delta
	if buffer_timer > 0:
		buffer_timer -= delta

	if input_data.get("jump_release", false) and v.y < 0:
		v.y *= 0.5

	return v
