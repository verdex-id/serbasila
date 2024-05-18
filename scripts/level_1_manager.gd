extends Node

var sila_list = [
	{
		"number": 1,
		"icon_name": "bintang",
		"name": "Ketuhanan yang Maha Esa",
	},
	{
		"number": 2,
		"icon_name": "rantai",
		"name": "Kemanusiaan yang adil dan beradab",
	},
	{
		"number": 3,
		"icon_name": "beringin",
		"name": "Persatuan Indonesia",
	},
	{
		"number": 4,
		"icon_name": "banteng",
		"name": "Kerakyatan yang dipimpin oleh hikmat kebijaksanaan dalam permusyawaratan/perwakilan, serta",
	},
	{
		"number": 5,
		"icon_name": "padikapas",
		"name": "Keadilan sosial bagi seluruh rakyat Indonesia",
	}
]

var current_sila = null

func get_sila():
	if (current_sila != null):
		return current_sila
	current_sila = sila_list.pick_random()
	return current_sila

func collect_sila(sila_icon_name):
	print(sila_list)
	
func _on_level_one_ready():
	Music.kembang_api(45)
	var finish_points = get_tree().get_nodes_in_group("finish")
	finish_points.shuffle()
	
	var finish_correct = finish_points[0]
	finish_points = finish_points.slice(1)
	finish_correct.set_sila(current_sila, true)
	
	for point in finish_points:
		point.set_sila(sila_list.pick_random(), false)
	
	
