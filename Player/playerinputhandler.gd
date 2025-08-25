extends Node
class_name InputModule

func get_input() -> Dictionary:
	return {
		# Movement
		"left": Input.is_action_pressed("left"),
		"right": Input.is_action_pressed("right"),
		"up": Input.is_action_pressed("up"),
		"down": Input.is_action_pressed("down"),
		"move": Vector2(
			Input.get_action_strength("right") - Input.get_action_strength("left"),0),

		# Core actions
		"jump": Input.is_action_just_pressed("jump"),
		"jump_release": Input.is_action_just_released("jump"),
		"dash": Input.is_action_just_pressed("dash"),

		# Combat
		"attack": Input.is_action_just_pressed("attack"),
		"sp_attack": Input.is_action_just_pressed("sp.attack"),
		"roll": Input.is_action_just_pressed("roll"),

		# Interaction
		"interact": Input.is_action_just_pressed("interact"),
		"heal": Input.is_action_just_pressed("heal"),
	}
