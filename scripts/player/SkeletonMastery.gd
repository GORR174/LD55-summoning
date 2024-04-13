extends Node2D


@onready var skeleton = preload("res://prefabs/skeleton/Skeleton.tscn")

var max_num = 2
var cooldown = false
var cooldown_time = 10


func exec():
	if !cooldown and get_tree().get_nodes_in_group("skeleton").size() < max_num:
		var bones_position = Global.pick_bones()
		if bones_position == null:
			return false
		var skeleton = skeleton.instantiate()
		skeleton.position = bones_position
		Global.game_ref.add_child(skeleton)
		cooldown = true
		get_tree().create_timer(cooldown_time).timeout.connect(reset_cooldown)
		return true
	return false

func reset_cooldown():
	cooldown = false
