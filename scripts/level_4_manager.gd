extends Node

@onready var timer = $"../Player/Timer"


func _on_level_four_ready():
	timer.timer_start()
