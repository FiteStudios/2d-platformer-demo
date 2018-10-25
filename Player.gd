extends KinematicBody2D

# Consts never change
const UP = Vector2(0, -1)
const GRAVITY = 35
const SPEED = 350
const JUMP_HEIGHT = 750

# Variable to hold new motion
var motion = Vector2()

# Called every frame
func _physics_process(delta):
	
	# Apply gravity to the player every frame
	motion.y += GRAVITY
	
	# Controls for right/left movement
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
	else:
		motion.x = 0
		
	# Actions that can only be performed if on ground
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			motion.y = -JUMP_HEIGHT
	
	# Apply motion and set for next frame
	motion = move_and_slide(motion, UP)
	pass
