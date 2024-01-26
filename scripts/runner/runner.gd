extends Node

@export var time_left : int = 60

func _ready():
	$Time_left.text = "Time Left: " + str(time_left)

func _on_counting_timer_timeout():
	if time_left > 0:
		time_left -= 1 
		$Time_left.text = "Time Left: " + str(time_left)

	if time_left == 0:
		if has_node('Spawner'):
			$Spawner.queue_free()
			
		####### Acrescentar a transição aqui 
		get_tree().reload_current_scene()
