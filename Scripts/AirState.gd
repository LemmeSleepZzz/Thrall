extends State

class_name AirState

@export var landing_state : State
@export var landing_anim : String = "ending_jump"

func state_process(delta):
	if character.is_on_floor():
		print("Character is on the floor")
		next_state = landing_state


func on_exit():
	if (next_state == landing_state):
		playback.travel(landing_anim)

