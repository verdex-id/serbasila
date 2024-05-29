extends CharacterBody2D

var speed = 100
var player_is_in_area = false
var player

@onready var animated_sprite_2d = $AnimatedSprite2D

func _physics_process(delta):
	if (player):
		if (player_is_in_area):
			position += (player.position - position) / speed
			
			if (player.position.x - position.x) < 0:
				animated_sprite_2d.flip_h = true
			else:
				animated_sprite_2d.flip_h = false
		else:
			animated_sprite_2d.play("default")
		
		var isLeft = velocity.x < 0
		animated_sprite_2d.flip_h = isLeft




func _on_detected_area_body_entered(body):
	if (body.name == "Player"):
		player_is_in_area = true
		player = body

