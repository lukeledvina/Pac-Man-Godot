extends Area2D

signal eaten(pellet)


func _on_body_entered(_body):
	emit_signal("eaten", self)
