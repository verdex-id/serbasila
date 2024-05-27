extends Area2D


func _on_body_entered(body):
	if (body.name == "Player"):
		var player = get_node(body.get_path())
		if (player.health < 100):
			player.health = 100
			player.update_health()
			queue_free()
