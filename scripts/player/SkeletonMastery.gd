extends Node2D


@onready var skeleton = preload("res://prefabs/skeleton/Skeleton.tscn")

var max_num = 2


func _on_timer_timeout():
	if get_tree().get_nodes_in_group("skeleton").size() < max_num:
		var bones_position = Global.pick_bones()
		if bones_position == null:
			return
		var skeleton = skeleton.instantiate()
		skeleton.position = bones_position
		Global.game_ref.add_child(skeleton)
		
