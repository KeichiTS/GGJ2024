extends Node

var paused : bool = false
var dwarves_counter : int = 0 
var points : int = 0 
var bar_points : int = 0

func _ready():
	$points.text = "Points: " + str(points)
	$bar_anim.play('event')


func _process(delta):
	if Input.is_action_just_pressed("advance_dialog") and paused == false:
		dwarves_counter += 1
		points += bar_points
		paused = true
		$bar_anim.pause()
		$whip_anim.play('event')
		$pause_timer.start()

func _on_area_1_area_entered(area):
	if area.name == 'bar':
		print('entrou')
		bar_points = 5

func _on_area_2_area_entered(area):
	if area.name == 'bar':
		print('entrou2')
		bar_points = 2

func _on_area_3_area_entered(area):
	if area.name == 'bar':
		print('entrou3')
		bar_points = 0


func _on_area_1_area_exited(area):
	if area.name == 'bar':
		bar_points = 2

func _on_pause_time_timeout():
	$points.text = "Points: " + str(points)
	
	if dwarves_counter == 7: 
		
		if points >= 15:
			get_tree().change_scene_to_file("res://scenes/plot_scenes/intro.tscn")
		else:	
			get_tree().reload_current_scene()
		
	$bar_anim.play('RESET')
	$bar_anim.play('event')
	paused = false 
