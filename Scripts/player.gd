extends CharacterBody2D


# cast a ray, if there is no intersection, then move that way when pressing direction
var direction: Vector2 = Vector2.ZERO
var speed: int = 100


func _process(_delta):
	if Input.is_action_pressed("up"):
		direction = Vector2.UP
	elif Input.is_action_pressed("down"):
		direction = Vector2.DOWN
	elif Input.is_action_pressed("left"):
		direction = Vector2.LEFT
	elif Input.is_action_pressed("right"):
		direction = Vector2.RIGHT
		
	velocity = direction * speed
	move_and_slide()
