#Code by: KeichiTS - 2023


extends CharacterBody2D


@export var speed : int = 300
@export var jump_velocity : int = -1000
@export var gravity : int = 4000

var coyote_jump = false

enum{on_ground, on_air}
var move_status = on_ground

enum{dead,alive}
var status = alive

var is_holding = false 
var can_hold = false



var time = 5

var play_dead_sound = false 



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
			
		if status == alive:
			if is_on_floor() or coyote_jump:
				if Input.is_action_just_pressed("ui_jump"):
					velocity.y = jump_velocity
					coyote_jump = false

			var direction = Input.get_axis("ui_left", "ui_right")
			if direction:
				velocity.x = direction * speed
			else:
				velocity.x = move_toward(velocity.x, 0, speed)
		
		var was_on_floor = is_on_floor()
		
		
		move_and_slide()
		
		var left_ground = not is_on_floor() and was_on_floor
		if left_ground and velocity.y >= 0:
			print("pulou")
			coyote_jump = true
			$CoyoteTime.start()
	
func _chance_anim():
	#if status == alive:
			#if move_status == on_ground and velocity.x == 0:
				#$anim.play("idle")
			#elif move_status == on_ground and velocity.x != 0:
				#$anim.play('walking')
			#elif move_status == on_air:
				#$anim.play("Jumping")
			
			if velocity.x > 0: 
				$sprite.scale.x = 10
			elif velocity.x ==0:
				pass
			else:
				$sprite.scale.x = -10

				
func _on_coyote_time_timeout():
	coyote_jump = false
			


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



