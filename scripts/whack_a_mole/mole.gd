#Code by: KeichiTS - 2024

extends Button

var happy : bool = true

func _ready():
	randomize()
	$timer.wait_time = randf_range(3,7)
	$timer.start()
	
func _on_pressed():
	if happy == true:
		$anim2.play('event')
		if get_parent().get_parent().has_method('_add_points'):
			get_parent().get_parent()._add_points()
		happy = false


func _on_timer_timeout():
	_mole_action()

func _mole_action():
	$anim.play('event')
	await $anim.animation_finished
	$timer.wait_time = randf_range(3,7)
	happy = true
