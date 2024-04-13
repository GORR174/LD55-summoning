extends Node2D


func _physics_process(delta):
	position = (get_global_mouse_position() - (get_parent().position + Vector2(0.0, 300.0))) / 7.0
	
	Global.camera_ref.position = global_position
