extends Node

@onready var timer = $"../Player/Timer"



func _on_level_five_ready():
	Music.cara_ceroboh(1.5)
	timer.timer_start()


func _on_answer_1_correct_body_entered(body):
	if (body.name == "Player"):
		$"../Answer1/Answer1Correct/Label".text = "Benar! Lanjutkan"


func _on_answer_1_wrong_body_entered(body):
	if (body.name == "Player"):
		$"../Answer1/Answer1Wrong/Label".text = "Salah!"


func _on_answer_2_correct_body_entered(body):
	if (body.name == "Player"):
		$"../Answer1/Answer1Correct/Label".text = "Benar! Lanjutkan"


func _on_answer_2_wrong_body_entered(body):
	if (body.name == "Player"):
		$"../Answer1/Answer1Wrong/Label".text = "Salah!"
