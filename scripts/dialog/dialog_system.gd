extends Node

var text : String = ''
var pivot = 0
var can_play = true
var can_talk = true
var line_counter = 0 

var lines: Array[String] = [
	'O codigo nao conseguiu encontrar o dialogo desta cena',
	'verifique se o script esta extendndo o call_dialog',
	'essa funcao e necessaria para chamar o dialog',
	'verifique tambem se a array foi foi chamada de "lines" no script pai',
	'boa sorte'
]

func _ready():
	if get_parent().has_method('_call_text_array'):
		lines = get_parent().lines
	text = lines[0]
	$label.text = text
	
func _process(delta):
	_can_talk()


func _can_talk():
	if can_talk == true:
		$anim.play('event')
		can_talk = false
	
	if pivot < len(text) and can_play == true:
		can_play = false 
		pivot += 1 
		$label.visible_characters = pivot
		$timer.start()
		
	if pivot == len(text):
		$Name.show()
		$anim.pause()
		if Input.is_action_just_pressed("advance_dialog") and line_counter <= len(lines):
			$Name.hide()
			can_talk = true
			pivot = 0
			line_counter += 1 
			if get_parent().has_method('_line_counter'):
				get_parent()._line_counter()
			if line_counter < len(lines):
				text = lines[line_counter]
				$label.text = text
			else:
				can_play = false 
				$label.queue_free()
				$path_rect.queue_free()
				$sprite.queue_free()
				$sfx.queue_free()
	

func _on_timer_timeout():
	can_play = true
