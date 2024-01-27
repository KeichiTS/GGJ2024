#Code by: KeichiTS - 2024

extends CharacterBody2D

var speed : int = -500

func _ready():
	velocity.x = speed

func _process(delta):
	move_and_slide()
	
func _on_hitbox_body_entered(body):
	if body.name == 'Player':
		body._death()
