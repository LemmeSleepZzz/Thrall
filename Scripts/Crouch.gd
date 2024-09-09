extends State

class_name crouch

@export var ground_state: State
@export var crouch_State: String = "crouch"



func _on_animation_tree_animation_finished(anim_name):
	if anim_name == crouch_State:
		next_state = ground_state
