extends Node
class_name State


var pl: KinematicBody2D

onready var _states: Dictionary = {}
var jump: bool
var dir: float
var next_state : State


func enter() -> void:
	pass
	

func logic() -> void:
	pass




func get_input() -> void:
	pass
	

func get_transition() -> State:
	return next_state
