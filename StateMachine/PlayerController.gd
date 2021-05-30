extends KinematicBody2D

var dir: int
const SLOPE_STOP = 0
var input_direction : int
var speed = 500
const UP = Vector2(0, -1)
var gravity = 2000
var velocity = Vector2()
var jump_velocity = -900

func _physics_process(delta):
	_gravity(delta)
	get_input_direction(input_direction)
	velocity = move_and_slide(velocity, UP, SLOPE_STOP)

func _gravity(delta):
	velocity.y += gravity * delta

#func _input(event):
#	jump()

#func move_player():
#	velocity = move_and_slide(velocity, UP, SLOPE_STOP)

func jump():
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity

func get_input_direction(dir: int) -> void:
	velocity.x = 0
	velocity.x = dir
	
	var left = Input.is_action_pressed("ui_left")
	var right = Input.is_action_pressed("ui_right")
	input_direction = -int(left) + int(right)
	
	velocity.x = lerp(velocity.x, speed * input_direction, 0.3)
	jump()

