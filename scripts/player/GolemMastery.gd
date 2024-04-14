extends Node2D

class_name GolemMastery


@onready var golem_scene = preload("res://prefabs/golem/Golem.tscn")

var max_num = 1
var cooldown = false
var cooldown_time = 1


var additional_damage: int = 0
var additional_hp: int = 0


func exec():
	if !cooldown and get_tree().get_nodes_in_group("golem").size() < max_num:
		var bones_position = Global.pick_bones()
		if bones_position == null:
			return false
		var golem = golem_scene.instantiate()
		golem.position = bones_position
		golem.damage += additional_damage
		var s_health = golem.find_child("HealthSystem")
		s_health.max_health += additional_hp
		s_health.health = s_health.max_health
		Global.game_ref.add_child(golem)
		cooldown = true
		get_tree().create_timer(cooldown_time, false).timeout.connect(reset_cooldown)
		return true
	return false

func reset_cooldown():
	cooldown = false
