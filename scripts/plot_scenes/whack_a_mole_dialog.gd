extends call_dialog

var next_scene : String = "res://scenes/instruction_scenes/instruction_whack_a_mole.tscn"
var change_scene : bool = false
var lines: Array[String] = [
	"7 dwarves? More like 700.",
	"I gotta bump them off, but I'm also savvy enough to tell the unrelated plugs apart.",
	"If they are'nt a parte of the dwarven mob I better not clobber them.",
	"If I got a berry for each time in my life that clobbered a princess with a key I would have two berries.",
	"Not much, but it is amusing it happened twice.",
	"At least this time around it's not also a blade.",
	"I'm clean of that baloney."
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
