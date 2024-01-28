extends Node

func _ready():
	$Transition_screen/anim.play('open_curtains')
	await $Transition_screen/anim.animation_finished	

func _on_button_pressed():
	$Button.disabled = true
	$Transition_screen/anim.play('close_curtains')
	await $Transition_screen/anim.animation_finished
	get_tree().change_scene_to_file("res://scenes/plot_scenes/runner_dialog.tscn")
