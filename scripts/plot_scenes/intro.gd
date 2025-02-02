extends call_dialog

var change_scene : bool = false
var next_scene : String = "res://scenes/title/title.tscn"
var lines: Array[String] = [
	"My name is Gabriel Gabiru. I'm a star in the wood, of the holy kind, if you catch my song.",
	"For 100 years, I have been locked in this castle, forced to enrich a man that claimed to be my father.",
	"Know this: I'm the bee's knees of this place. But now that the old man became icecream, I am free, and this empire will fall.",
	"For that is the style of this time.",
	"In order to scram, I need to face the other inmates of this applesauce of a place.",
	"Some of them were born here, like me.",
	"They are waiting for their bits to end. Some became prisoners by their own choice.",
	"And those are not leaving. Not without my personal push.",
	"I know that I'm not leaving this place until I take down his right hand: ",
	"Snow White, and her mob of dwarves and 'princesses'."
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
