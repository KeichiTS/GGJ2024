extends call_dialog

var next_scene : String = "res://scenes/end/end.tscn"
var change_scene : bool = false
var lines: Array[String] = [
	"Hi!",
	"You can't keep playing this game yet",
	"Supposedly why the creators didn't have time to finish it",
	"'supposedly'",
	"supposedly, the creators will continue developing the game beyond the time of the Global Game Jam by the USP core, which is just 48 hours",
	"'supposedly'",
	"giving a spoiler, I was supposed to face the princess and my father, the great VALDISNEI",
	"but only 'S U P P O S E D L Y'",
	"well, if the game doesn't continue, you can consider this ending:",
	"I die right now",
	"anti-climactic, right?",
	"Well, I really don't care",
	"Close the curtains, plz!"
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
