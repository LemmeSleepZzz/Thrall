extends Node

class_name State

@export var it_can : bool = true
@export var is_crouching : bool = false

var character : CharacterBody2D
var next_state : State
var playback: AnimationNodeStateMachinePlayback

func state_process(delta):
	pass

func state_input(event : InputEvent):
	pass


func on_enter():
	pass
	
func on_exit():
	pass
