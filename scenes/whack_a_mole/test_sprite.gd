#Code by: KeichiTS - 2024

extends Sprite2D


func _input(event):
	if event is InputEventMouseButton and event.is_action_pressed("click"):
		print('clicou')
