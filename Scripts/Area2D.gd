extends Area2D

@export var damage : int  = 8

func _on_body_entered(body):
	for child in body.get_children():
		if child is Demagable:
			child.dmg(damage)
