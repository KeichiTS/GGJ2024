#Code by: KeichiTS - 2024

extends Area2D

var monster = preload("res://scenes/runner/monster.tscn")
var counter_to_start : int = 0

func _ready():
	randomize()
	spawn_monster()


func _on_timer_timeout():
	spawn_monster()

func spawn_monster():
	if counter_to_start < 3:
		counter_to_start += 1
		
	else: 
		var monster_type : int = randi_range(0,3)
		var mob = monster.instantiate()
		if monster_type == 0:
			mob.on_ground = false
			mob.position = Vector2(0,64)
		else:
			mob.on_ground = true
			mob.position = Vector2(0,132)
		add_child(mob)
	
###################################################
#     ~ It ain't much, but it's honest work ~     #
###################################################
##        #####################################   #
##          #############################         #
####            ######################            #
#####            #####           #                #
#######                                         ###
#########  #                                   ####
###########                              ## #######
#########      ###               ###       ########
#########     # ###             #####       #######
########      #####             ####         ######
########       ##                ##          ######
#######               ##                    #######
#######  ##           ####            ##      #####
####### #####        ########       #######    ####
########               #####                    ###
#########                                       ###
##########                                       ##
#########                                         #
###################################################
#               ~ KeichiTS - 2024 ~               #
###################################################
