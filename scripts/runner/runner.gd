#Code by: KeichiTS - 2024

extends Node

@export var time_left : int = 60

func _ready():
	$Time_left.text = "Time Left: " + str(time_left)

func _on_counting_timer_timeout():
	if time_left > 0:
		time_left -= 1 
		$Time_left.text = "Time Left: " + str(time_left)

	if time_left == 0:
		if has_node('Spawner'):
			$Spawner.queue_free()
			
		####### Acrescentar a transição aqui 
		get_tree().change_scene_to_file('res://scenes/plot_scenes/whack_a_mole_dialog.tscn')

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
