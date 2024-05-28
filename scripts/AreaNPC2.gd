extends Area2D

var is_opened = false

func _on_body_entered(body):
	if (body.name == "Player"):
		if (is_opened == false):
			is_opened = true
			$Label.text = "Dialog 1/3: Terimakasih %s!, wahhh keren banget kamu sudah bantu aku tadi." % LevelManager.player_username
			await get_tree().create_timer(3).timeout
			$Label.text = "..."
			await get_tree().create_timer(1).timeout
			$Label.text = "Dialog 2/3: Nah, setau aku kamu tadi sudah mengamalkan sila ke - 2. Betulkan?"
			await get_tree().create_timer(3).timeout
			$Label.text = "..."
			await get_tree().create_timer(1).timeout
			$Label.text = "Dialog 3/3: Nah, contoh lain sila ke 2 apa lagi ya?"
