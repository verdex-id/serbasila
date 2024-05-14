extends CharacterBody2D

@onready var player = $AnimatedSprite2D

const SPEED = 300.0
const JUMP_VELOCITY = -800.0
var gravity = 2000


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	var isLeft = velocity.x < 0
	player.flip_h = isLeft
	
	if (velocity.x > 1 || velocity.x < -1):
		player.animation = "walk"
	else:
		player.animation = "idle"
