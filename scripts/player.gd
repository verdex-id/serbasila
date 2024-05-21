extends CharacterBody2D

@onready var player = $AnimatedSprite2D

const SPEED = 300.0
const JUMP_VELOCITY = -800.0
var gravity = 2000

var enemy_is_in_hitbox = false
var trap_is_in_hitbox = false
var enemy_attack_cooldown = false
var health = 100
var alive = true


func _physics_process(delta):
	player_movement(delta)
	enemy_attack_check()
	trap_attack_check()
	
func player_movement(delta):
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


func _on_hitbox_body_entered(body):
	if ("Enemy" in body.name):
		enemy_is_in_hitbox = true
		
	if ("Trap" in body.name):
		trap_is_in_hitbox = true


func _on_hitbox_body_exited(body):
	if ("Enemy" in body.name):
		enemy_is_in_hitbox = false
		
	if ("Trap" in body.name):
		trap_is_in_hitbox = false
		
func _on_hitbox_area_entered(area):
	if ("Enemy" in area.name):
		enemy_is_in_hitbox = true
		
	if ("Trap" in area.name):
		trap_is_in_hitbox = true


func _on_hitbox_area_exited(area):
	if ("Enemy" in area.name):
		enemy_is_in_hitbox = false
		
	if ("Trap" in area.name):
		trap_is_in_hitbox = false
		
@onready var attack_cooldown = $AttackCooldown
@onready var health_label = $Health

func trap_attack_check():
	if (trap_is_in_hitbox and enemy_attack_cooldown == false):
		if (health <= 0):
			alive = false
			get_tree().change_scene_to_file(get_tree().current_scene.scene_file_path)
			return
			
		enemy_attack_cooldown = true
		health -= 8.4
		update_health()
		
		attack_cooldown.start()
		
func enemy_attack_check():
	if (enemy_is_in_hitbox and enemy_attack_cooldown == false):
		if (health <= 0):
			alive = false
			get_tree().change_scene_to_file(get_tree().current_scene.scene_file_path)
			return
			
		enemy_attack_cooldown = true
		health -= 9.7
		update_health()
		
		attack_cooldown.start()
			

func update_health():
	health_label.text = "♥ %0.1f" % health
	if (health > 60):
		health_label.add_theme_color_override("font_color", "green")
	elif (health > 40):
		health_label.add_theme_color_override("font_color", "yellow")
	else:
		health_label.add_theme_color_override("font_color", "red")

func _on_attack_cooldown_timeout():
	enemy_attack_cooldown = false

