extends Node2D

class_name FleshMastery


@onready var tower_scene = preload("res://prefabs/flesh_tower/FleshTower.tscn")

var cooldown = false
var cooldown_time = 30

var additional_damage: int = 0
var time_to_live: int = 10
var is_opened = false


func exec():
	if !cooldown and is_opened:
		var bones_position = Global.pick_bones()
		if bones_position == null:
			return false
		var tower = tower_scene.instantiate()
		tower.position = bones_position
		tower.damage += additional_damage
		Global.game_ref.add_child(tower)
		cooldown = true
		get_tree().create_timer(time_to_live, false).timeout.connect(tower.queue_free)
		get_tree().create_timer(cooldown_time, false).timeout.connect(reset_cooldown)
		return true
	return false

func reset_cooldown():
	cooldown = false
