#Code by: KeichiTS - 2024

extends Node2D

var happy : bool = true
var falix_the_cat :bool = false

func _ready():
	randomize()
	$mole/timer.wait_time = randf_range(3,7)
	$mole/timer.start()
	
	
func _on_mole_pressed():
	if happy == true:
		$mole/anim2.play('event')
		if get_parent().has_method('_add_points'):
			get_parent()._add_points()
		happy = false

func _on_timer_timeout():
	var change : float = randf_range(0,1)
	if change < 0.95:
		$mole/sprite.texture = preload('res://assets/whack_a_mole/whack_anão.png')
	else:
		$mole/sprite.texture = preload('res://assets/whack_a_mole/whack_refem.png')
	
	_mole_action()

func _mole_action():
	$mole/anim.play('event')
	await $mole/anim.animation_finished
	$mole/timer.wait_time = randf_range(3,7)
	happy = true

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


