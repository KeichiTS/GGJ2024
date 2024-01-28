extends call_dialog

var change_scene : bool = false
var next_scene : String = "res://scenes/instruction_scenes/instruction_runner.tscn"
var lines: Array[String] = [
	"Time to take the run out. I can reach the exit in about 1 minute if I don't rap in the rats and dice in the way.",
	"I have to find the key before leaving.",
	"I found the key! Now I can unlock the door to the next floor.",
	"Better yet, this thing is as big as the profit margin of this castle.",
	"There's a lot of clobbering waiting to be done with it."
	]

func _ready():
	$Transition_screen/anim.play('open_curtains')
	await $Transition_screen/anim.animation_finished

func _process(delta):
	if line_counter == len(lines) and change_scene == false:
		change_scene = true
		$Transition_screen/anim.play('close_curtains')
		await $Transition_screen/anim.animation_finished
		get_tree().change_scene_to_file(next_scene)
