extends Node2D

enum {
	IDLE,
	NEW_DIRECTION,
	MOVE
}

const SPEED = 100
var velocity = Vector2()
func _ready():
	randomize()

var state = MOVE
var direction = Vector2.RIGHT

func _process(delta):
	match state:
		IDLE:
			pass
		NEW_DIRECTION:
			direction = choose([ Vector2.RIGHT, Vector2.UP, Vector2.LEFT, Vector2.DOWN])
			state = choose([IDLE, MOVE])
		MOVE:
			move(delta)


func move(delta):
	position += direction * SPEED * delta

func choose(array):
	array.shuffle()
	return array.front()
	print (array.front())
	
func get_input_direction():
	var input_direction = Vector2()
	input_direction = -int(Input.is_action_pressed("ui_left")) + int(Input.is_action_pressed("ui_right"))
	velocity.x = lerp(velocity.x, SPEED * input_direction, 0.1)

func _on_Timer_timeout():
	$Timer.wait_time = choose([0.5, 1.0, 2.0])
	state = choose([IDLE, NEW_DIRECTION, MOVE])
