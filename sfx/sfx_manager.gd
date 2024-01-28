extends Node

@onready var bgm = $BGM
@onready var bgm_timer = $BGM_Timer
@onready var jump = $Jump
@onready var hit = $Hit
@onready var anao = $Anao

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_bgm_finished():
	bgm.pitch_scale = randf_range(0.75,0.9)
	bgm_timer.start()
	


func _on_bgm_timer_timeout():
	bgm_timer.wait_time = randf_range(3.5,5.5)
	bgm.play()
	

func jumped():
	jump.play()

func hited():
	hit.play()

func anaoed():
	anao.play()
