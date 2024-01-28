extends Node

@export var oppened_curtains : bool = false

func _ready():
	$Curtain.visible = true
	if oppened_curtains == false:
		$Curtain.position.y = -270
	else:
		$Curtain.position.y = 0
