extends CharacterBody2D


# cast a ray, if there is no intersection, then move that way when pressing direction
var direction: Vector2 = Vector2.ZERO
var speed: int = 100

@onready var animation_player = $AnimationPlayer
@onready var sprite = $Sprite2D

#region Raycast definitions
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

func _process(_delta):
	if Input.is_action_pressed("up") && not (raycast_up_1.is_colliding() or raycast_up_2.is_colliding() or raycast_up_3.is_colliding()):
		direction = Vector2.UP
		sprite.rotation_degrees = 270
		animation_player.play("MoveRight")
	elif Input.is_action_pressed("down") && not (raycast_down_1.is_colliding() or raycast_down_2.is_colliding() or raycast_down_3.is_colliding()):
		direction = Vector2.DOWN
		sprite.rotation_degrees = 90
		animation_player.play("MoveRight")
	elif Input.is_action_pressed("left") && not (raycast_left_1.is_colliding() or raycast_left_2.is_colliding() or raycast_left_3.is_colliding()):
		direction = Vector2.LEFT
		sprite.rotation_degrees = 180
		animation_player.play("MoveRight")
	elif Input.is_action_pressed("right") && not (raycast_right_1.is_colliding() or raycast_right_2.is_colliding() or raycast_right_3.is_colliding()):
		direction = Vector2.RIGHT
		sprite.rotation_degrees = 0
		animation_player.play("MoveRight")
		
	velocity = direction * speed
	move_and_slide()
