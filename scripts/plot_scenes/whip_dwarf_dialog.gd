extends call_dialog

var change_scene : bool = false
var next_scene : String = "res://scenes/instruction_scenes/instruction_whip_dwarf.tscn"
var lines: Array[String] = [
	"Let me out of the big house, gal.",
	"I want no beef you don't want it either.",
	"I now sing the Freeman's Rhapsody.",
	"Why honey?",
	"Work under me baby, and we will be in cat's pajamas for life!",
	"You got the wrong gabiru.",
	"I like no cats and I like no you.",
	"So I guess it's time you join the Big Cheese in the ice room, goosey.",
	"Can't be worse than hanging with those whippsnappers with big feels and feet."
	
	]


func _ready():
	$Transition_screen/anim.play('open_curtains')
	await $Transition_screen/anim.animation_finished

func _process(delta):
	if line_counter == 3:
		$dialog_system/sprite.hide()
		$dialog_system/sprite2.show()
		
	if line_counter == 5:
		$dialog_system/sprite.show()
		$dialog_system/sprite2.hide()
		
	if line_counter == 7:
		$dialog_system/sprite.hide()
		$dialog_system/sprite2.show()

	if line_counter == 8:
		$dialog_system/sprite.show()
		$dialog_system/sprite2.hide()
	
	if line_counter == len(lines) and change_scene == false:
		change_scene = true
		$Transition_screen/anim.play('close_curtains')
		await $Transition_screen/anim.animation_finished
		get_tree().change_scene_to_file(next_scene)
