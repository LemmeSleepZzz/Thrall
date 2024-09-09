extends Node2D

@onready var timer = $Timer
@export var dash_duration = 0.4  # Dash duration in seconds
var dash_start_time = 0.0 
var dash_direction = 1  # 1 for right, -1 for left

func start_dash():
	# Get the dash direction based on the character's input
	var direction = get_player_input_direction()
	dash_direction = direction
	dash_start_time = Time.get_ticks_msec() / 1000.0
	timer.wait_time = dash_duration
	timer.start()

func is_dashing():
	return Time.get_ticks_msec() / 1000.0 - dash_start_time < dash_duration

func get_dash_direction():
	return dash_direction

func stop_dash():
	timer.stop()

# Helper function to get the player's input direction
func get_player_input_direction():
	var direction = Input.get_axis("move_left", "move_right")
	if direction != 0:
		return direction
	else:
		return 1  # Default to right if no input
