extends call_dialog

var next_scene : String = "res://scenes/whip_dwarf/whip_dwarf.tscn"
var lines: Array[String] = [
	"whip dwarf",
	"whip dwarf",
	"whip dwarf",
	]

func _process(delta):
	if line_counter == len(lines):
		get_tree().change_scene_to_file(next_scene)
