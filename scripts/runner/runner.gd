#Code by: KeichiTS - 2024

extends Node

var change_scene : bool = false
@export var time_left : int = 60

func _ready():
	$Time_left.text = "Time Left: " + str(time_left)
	$Transition_screen/anim.play('open_curtains')
	await $Transition_screen/anim.animation_finished

func _on_counting_timer_timeout():
	if time_left > 0:
		time_left -= 1 
		$Time_left.text = "Time Left: " + str(time_left)

	if time_left == 0 and change_scene == false:
		change_scene = true
		if has_node('Spawner'):
			$Spawner.queue_free()
			
		$Transition_screen/anim.play('close_curtains')
		await $Transition_screen/anim.animation_finished
		get_tree().change_scene_to_file('res://scenes/plot_scenes/whack_a_mole_dialog.tscn')


func _reload_scene():
	$Transition_screen/anim.play('close_curtains')
	await $Transition_screen/anim.animation_finished
	get_tree().reload_current_scene()

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
