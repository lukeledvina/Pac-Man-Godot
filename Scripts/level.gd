extends Node2D

@onready var player: CharacterBody2D = $Player
@onready var pellet_container: Node2D = $Pellets

func _on_left_zone_body_entered(_body):
	player.global_position = Vector2(224, 152)


func _on_right_zone_body_entered(_body):
	player.global_position = Vector2(0, 152)
	

func _ready():
	var pellets = pellet_container.get_children()
	
	for pellet in pellets:
		pellet.connect("eaten", _on_pellet_eaten)
		
func _on_pellet_eaten(pellet):
	pellet.queue_free()
