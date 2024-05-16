extends Area2D
@onready var level_1_manager = $"../Level1Manager"
@onready var label = $Label

var is_correct = false

func _on_body_entered(body):
	if (body.name == "Player"):
		if (is_correct):
			label.text = "Benar!"
		else:
			label.text = "Salah!"

func set_sila(sila, value):
	is_correct = value
	label.text = "Sila ke-%d\n%s" % [sila.number, sila.name]
