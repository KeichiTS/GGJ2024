extends Sprite2D


@export var speed : float = 15
var texture_width : float = 0 

#func _ready():
#	texture_width = texture.get_size().x + scale.x
	
func _process(delta):
	position.x += speed
	_attempt_reposition()
	
func _attempt_reposition():
	if position.x <= -texture.get_size().x:
		position.x = texture.get_size().x
