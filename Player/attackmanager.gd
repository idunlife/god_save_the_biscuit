extends Node
class_name AbilityModule

func update(input_data: Dictionary, delta: float, player: CharacterBody2D) -> void:
	if input_data["attack"]:
		print("Normal attack triggered")
	if input_data["sp_attack"]:
		print("Special attack triggered")
	if input_data["interact"]:
		print("Interact pressed")
	if input_data["heal"]:
		print("Heal used")
