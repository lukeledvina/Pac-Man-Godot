extends Node2D

@onready var player: CharacterBody2D = $Player
@onready var pellet_container: Node2D = $Pellets

@onready var score_number: Label = $UI/MarginContainer/HBoxContainer/VBoxContainer/ScoreNumber

var pellet_scene: PackedScene = preload("res://Scenes/pellet.tscn")
var starting_pos: Vector2 = Vector2(12, 48)
var current_pos: Vector2 = starting_pos
var final_pos: Vector2 = Vector2(212, 272)

func _on_left_zone_body_entered(_body):
	player.global_position = Vector2(224, 152)


func _on_right_zone_body_entered(_body):
	player.global_position = Vector2(0, 152)
	

func _ready():
	spawn_pellets()
	
	var pellets = pellet_container.get_children()
	
	for pellet in pellets:
		pellet.connect("eaten", _on_pellet_eaten)
	
	Globals.score -= 20
	score_number.text = str(Globals.score)
		
func _on_pellet_eaten():
	Globals.score += 10
	score_number.text = str(Globals.score)
	
	if pellet_container.get_child_count() <= 1:
		await get_tree().create_timer(2).timeout
		get_tree().reload_current_scene()
	
func spawn_pellets():
	while current_pos.y <= final_pos.y:
		var new_pellet = pellet_scene.instantiate()
		pellet_container.add_child(new_pellet)
		new_pellet.global_position = current_pos
		
		if current_pos.x >= final_pos.x:
			current_pos.x = starting_pos.x
			current_pos.y = current_pos.y + 8
		else:
			current_pos.x += 8
