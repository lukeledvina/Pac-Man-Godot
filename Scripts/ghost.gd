extends CharacterBody2D
class_name Ghost

@onready var animation_player = $AnimationPlayer

var player_pos: Vector2 = Vector2.ZERO
var direction: Vector2 = Vector2.ZERO
var speed: int = 75

#region Raycasts
@onready var raycast_up_1 = $Raycasts/RayCastUp
@onready var raycast_up_2 = $Raycasts/RayCastUp2
@onready var raycast_up_3 = $Raycasts/RayCastUp3

@onready var raycast_right_1 = $Raycasts/RayCastRight
@onready var raycast_right_2 = $Raycasts/RayCastRight2
@onready var raycast_right_3 = $Raycasts/RayCastRight3

@onready var raycast_left_1 = $Raycasts/RayCastLeft
@onready var raycast_left_2 = $Raycasts/RayCastLeft2
@onready var raycast_left_3 = $Raycasts/RayCastLeft3

@onready var raycast_down_1 = $Raycasts/RayCastDown
@onready var raycast_down_2 = $Raycasts/RayCastDown2
@onready var raycast_down_3 = $Raycasts/RayCastDown3

#endregion

var is_chasing: bool = true

func _process(_delta):
	player_pos = $"/root/Level/Player".global_position
	if is_chasing:
		if player_pos.x < global_position.x and not (raycast_left_1.is_colliding() or raycast_left_2.is_colliding() or raycast_left_3.is_colliding()):
			direction = Vector2.LEFT
		elif player_pos.x >= global_position.x and not (raycast_right_1.is_colliding() or raycast_right_2.is_colliding() or raycast_right_3.is_colliding()):
			direction = Vector2.RIGHT
		elif player_pos.y < global_position.y and not (raycast_up_1.is_colliding() or raycast_up_2.is_colliding() or raycast_up_3.is_colliding()):
			direction = Vector2.UP
		elif player_pos.y >= global_position.y and not (raycast_down_1.is_colliding() or raycast_down_2.is_colliding() or raycast_down_3.is_colliding()):
			direction = Vector2.DOWN
		else:
			direction = Vector2.ZERO
		
		
		
		#if not (raycast_up_1.is_colliding() or raycast_up_2.is_colliding() or raycast_up_3.is_colliding()):
			#pass
		#elif not (raycast_down_1.is_colliding() or raycast_down_2.is_colliding() or raycast_down_3.is_colliding()):
			#pass
		#elif not (raycast_left_1.is_colliding() or raycast_left_2.is_colliding() or raycast_left_3.is_colliding()):
			#pass
		#elif not (raycast_right_1.is_colliding() or raycast_right_2.is_colliding() or raycast_right_3.is_colliding()):
			#pass
	
	else:
		pass
		
	velocity = speed * direction
	move_and_slide()
