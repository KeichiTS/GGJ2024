extends AnimatedSprite2D

func _ready():
	play("default")
	SfxManager.hited()

func _on_animation_finished():
	queue_free()
