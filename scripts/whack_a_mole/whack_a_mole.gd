#Code by: KeichiTS - 2024

extends Node


var points : int = 00
@export var time_left : int = 60


func _ready():
	$Points.text = "Points: " + str(points)
	$Time_left.text = "Time Left: " + str(time_left)

func _on_counting_timer_timeout():
	if time_left > 0:
		time_left -= 1 
		$Time_left.text = "Time Left: " + str(time_left)

	if time_left == 0:
		if points >= 50:
			get_tree().change_scene_to_file("res://scenes/runner/runner.tscn")
			return
			
		get_tree().reload_current_scene()

func _add_points():
	$Points.text = "Points: " + str(points)
	points += 1
