extends Area2D

signal eaten()


func _on_body_entered(body):
	queue_free()
	if body.collision_layer == 1:
		call_deferred("emit_signal", "eaten")
