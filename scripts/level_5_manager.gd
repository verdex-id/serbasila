extends Node

@onready var timer = $"../Player/Timer"



func _on_level_five_ready():
	Music.cara_ceroboh(1.5)
	timer.timer_start()
