#Code by: KeichiTS - 2024

extends CharacterBody2D

@export var speed : int = 300
@export var jump_velocity : int = -1500
@export var gravity : int = 4500

var coyote_jump = false

enum{on_ground, on_air}
var move_status = on_ground

enum{dead,alive}
var status = alive

var on_jumping : bool = false

func _physics_process(delta):
	_move(delta)
	_chance_anim()

func _move(x):
	if status != dead:
		if not is_on_floor():
			move_status = on_air
			velocity.y += gravity * x
		else: 
			move_status = on_ground
			
		if is_on_floor() or coyote_jump:
			if Input.is_action_just_pressed("ui_jump"):
				SfxManager.jumped()
				velocity.y = jump_velocity
				coyote_jump = false

		var was_on_floor = is_on_floor()
		
		
		move_and_slide()
		
	
func _chance_anim():
	if status == alive:
			if move_status == on_ground and on_jumping == false:
				$anim.play("walking")
			#if move_status == on_ground and velocity.x != 0:
			#	$anim.play('walking')
			elif move_status == on_air:
				if on_jumping == false:
					print('entrou')
					on_jumping = true
					$anim.play("Jumping")
					await $anim.animation_finished
					on_jumping = false
			
			if velocity.x > 0: 
				$sprite.scale.x = 10
			elif velocity.x ==0:
				pass
			else:
				$sprite.scale.x = -10


func _death():
	SfxManager.hited()
	if get_parent().has_method('_reload_scene'):
		get_parent()._reload_scene()
		queue_free()
		
	else:
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
