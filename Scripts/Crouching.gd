extends State
class_name CrouchState

@export var state_machine: CharacterStateMachine
@export var stand_state: State
@export var crouch_idle_anim: String = 'CrouchIdle'
@export var stand_anim: String = "idle"

func state_process(delta):
	# Logic for idle crouching, no need to check if the player is moving
	# You could also add logic to check if the player should transition to the stand state
	pass  # Go back to standing if not on the floor

func state_input(event: InputEvent):
	if event.is_action_just_released("duck"):
		# Transition back to standing state when "duck" is released
		state_machine.switch_state(stand_state)

func on_enter():
	# Play the crouch idle animation when entering the crouch state
	playback.travel(crouch_idle_anim)
	print("Entered crouch state")

func _on_animation_tree_animation_finished(anim_name):
	if anim_name == crouch_idle_anim:
		# If the crouch animation finishes, transition to the stand state
		state_machine.switch_state(stand_state)
