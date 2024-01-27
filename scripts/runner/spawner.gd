#Code by: KeichiTS - 2024

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
	if monster_type == 0:
		mob.position = Vector2(0,64)
		mob.on_ground = false
	else:
		mob.position = Vector2(0,118)
		mob.on_ground = true
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
