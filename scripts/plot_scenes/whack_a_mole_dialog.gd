extends call_dialog

var next_scene : String = "res://scenes/whack_a_mole/whack_a_mole.tscn"
var lines: Array[String] = [
	"whack a mole",
	"whack a mole",
	"whack a mole",
	]

func _process(delta):
	if line_counter == len(lines):
		get_tree().change_scene_to_file(next_scene)
