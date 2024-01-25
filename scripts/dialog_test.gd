#A code by: KeichiTS - 2024

extends Area2D

const lines: Array[String] = [
	'test test test test test test test test test ',
	'asdasdasdasdasdasdasdasdasd',
	'qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq',
	'eeeeeeeeeeeeeeeeeeeeeeeeeeeee',
	'ffffffffffffffffffffffffffffff'
]



func _on_body_entered(body):
	if body.name == "Player":
		DialogManager.start_dialog(Vector2(300,300), lines)
