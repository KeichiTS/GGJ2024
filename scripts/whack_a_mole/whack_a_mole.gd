#Code by: KeichiTS - 2024

extends Node

var change_scene : bool = false
var points : int = 00
@export var time_left : int = 60


func _ready():
	$Points.text = "Points: " + str(points)
	$Time_left.text = "Time Left: " + str(time_left)
	$Transition_screen/anim.play('open_curtains')
	await $Transition_screen/anim.animation_finished
	

func _on_counting_timer_timeout():
	if time_left > 0:
		time_left -= 1 
		$Time_left.text = "Time Left: " + str(time_left)

	if time_left == 0:
		if points >= 50 and change_scene == false:
			change_scene = true
			$Transition_screen/anim.play('close_curtains')
			await $Transition_screen/anim.animation_finished
			get_tree().change_scene_to_file("res://scenes/plot_scenes/whip_dwarf_dialog.tscn")
			
		else:
			if change_scene == false:
				change_scene = true
				$Transition_screen/anim.play('close_curtains')
				await $Transition_screen/anim.animation_finished
				get_tree().reload_current_scene()

func _add_points():
	$Points.text = "Points: " + str(points)
	points += 1

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
