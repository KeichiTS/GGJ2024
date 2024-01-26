extends Area2D

var monster = preload("res://scenes/runner/monster.tscn")

func _ready():
	randomize()
	spawn_monster()


func _on_timer_timeout():
	spawn_monster()

func spawn_monster():
	var monster_type : int = randi_range(0,3)
	var mob = monster.instantiate()
	print(monster_type)
	if monster_type == 0:
		mob.position = Vector2(0,64)
	else:
		mob.position = Vector2(0,128)
	add_child(mob)
	
