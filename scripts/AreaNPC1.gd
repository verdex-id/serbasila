extends Area2D


func _on_body_entered(body):
	if (body.name == "Player"):
		$Label.text = "Dialog 1/2: Halo %s! selamat kamu sudah sampai di level 5 artinya kamu sudah paham dengan Pancasila." % body.username
		await get_tree().create_timer(3).timeout
		$Label.text = "..."
		await get_tree().create_timer(1).timeout
		$Label.text = "Dialog 2/2: kalau begitu tolongin aku ya, aku lagi bingung. Aku punya temen baru beda daerah, aku yang harus aku lakuin?"
