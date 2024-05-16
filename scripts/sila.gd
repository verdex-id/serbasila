extends Area2D
@onready var level_1_manager = $"../Level1Manager"
@onready var sila_object = %SilaObject

func _ready():
	var sila = level_1_manager.get_sila()
	sila_object.animation = sila.icon_name
	
func _on_body_entered(body):
	if (body.name == "Player"):
		queue_free()
