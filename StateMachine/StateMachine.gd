extends Node
class_name StateMachine

var _states: Dictionary = {}
var current_state : State


func ready():
	yield(get_parent(), "ready")
	
	for state in get_children():
		state[state.name] = state
	for state in get_children():
		state._states = self._states
		state.pl = get_parent()
	
	current_state = get_node(_states["Idle"].get_path())
	
	


func _physics_process(delta):
	current_state.logic()
	
	if current_state.get_transition() !=null:
		
		change_state(current_state.get_transition)

func enter_state() -> void:
	current_state.enter()

func change_state(nextState: State) -> void:
	current_state = nextState
	enter_state()
