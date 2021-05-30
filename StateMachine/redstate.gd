extends Node

var color_wanted = "00ff00"
var _sprite : = Sprite

func _physics_process(delta):
	
	if Input.is_action_just_pressed("ui_home"):
		get_parent().get_parent()._sprite.set_self_modulate(color_wanted)
		switch_color()
func switch_color():
	match color_wanted:
		"00ff00":
			color_wanted = "ffffff"
		"ffffff":
			color_wanted = "00ff00"
