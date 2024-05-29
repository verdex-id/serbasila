extends Area2D

var player_is_in_area = false
var player

func _process(delta):
	if (player):
		if (player_is_in_area):
			player.health -= 3
			player.update_health()

func _on_body_entered(body):
	if (body.name == "Player"):
		player_is_in_area = true
		player = body
	
func _on_body_exited(body):
	if (body.name == "Player"):
		player_is_in_area = false
		player = null
