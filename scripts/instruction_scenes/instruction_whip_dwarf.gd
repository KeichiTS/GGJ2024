extends Node


func _ready():
	$Transition_screen/anim.play('open_curtains')
	await $Transition_screen/anim.animation_finished
	
func _process(delta):
	pass


func _on_button_pressed():
	$Button.disabled = true
	$Transition_screen/anim.play('close_curtains')
	await $Transition_screen/anim.animation_finished
	get_tree().change_scene_to_file("res://scenes/whip_dwarf/whip_dwarf.tscn")
