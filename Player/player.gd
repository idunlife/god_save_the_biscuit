extends CharacterBody2D
class_name Player

@onready var input_module: InputModule = $InputModule
@onready var movement_module: MovementModule = $MovementModule
@onready var dash_module: DashModule = $DashModule
@onready var wall_module: WallModule = $WallModule
@onready var ground_pound_module: GroundPoundModule = $GroundModule
@onready var crouch_module: CrouchModule = $CrouchModule
@onready var ability_module: AbilityModule = $AbilityModule

func _physics_process(delta: float) -> void:
	var input_data: Dictionary = input_module.get_input()

	velocity = movement_module.calculate_velocity(input_data, velocity, delta)

	velocity = dash_module.apply_dash(input_data, velocity, delta, self)
	velocity = wall_module.apply_wall_actions(input_data, velocity, delta, self)
	velocity = ground_pound_module.apply_ground_pound(input_data, velocity, delta, self)
	velocity = crouch_module.apply_crouch(input_data, velocity, delta, self)
	move_and_slide()

	ability_module.update(input_data, delta, self)
