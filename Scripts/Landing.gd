extends State

class_name LandingState

@export var landing_anim: String = "landing"  # Animation name
@export var ground_state: State  # Reference to the ground state

func _on_animation_tree_animation_finished(anim_name):
	if anim_name == landing_anim:
		next_state = ground_state
		print("Character landed")
