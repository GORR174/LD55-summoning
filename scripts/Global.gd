extends Node


var player_ref: Node2D
var camera_ref: Camera2D
var game_ref: Node2D
var timer_ref: Node

var bones: Array
var enemies: Array

var enemy_spawner: Node2D

var max_level = 1
var enemies_killed = 0
var time_survived = "0:00"

var upgrades: Array = [
	Necronomicon2.new(),
	CorpseExplosion1.new(),
	FleshTower1.new(),
	HealthPotionUpgrade.new(),
	DamagePotionUpgrade.new(),
	MeleeUpgrade1.new(),
	Golem1.new()
]

var decorations: Array = [
	preload("res://textures/pentagram.png"),
	preload("res://textures/hmm.png"),
	preload("res://textures/puddle.png"),
	preload("res://textures/flowers.png"),
	preload("res://textures/flowers.png"),
	preload("res://textures/flowers.png"),
	preload("res://textures/die.png"),
	preload("res://textures/uwu.png"),
	preload("res://textures/ZombieHand.png"),
	preload("res://textures/godot.png"),
	preload("res://textures/rusty_machette.png"),
	preload("res://textures/pentagram.png"),
	preload("res://textures/hmm.png"),
	preload("res://textures/puddle.png"),
	preload("res://textures/flowers.png"),
	preload("res://textures/die.png"),
	preload("res://textures/uwu.png"),
	preload("res://textures/ZombieHand.png"),
	preload("res://textures/godot.png"),
]

func reset():
	bones.clear()
	enemies.clear()
	upgrades = [
		Necronomicon2.new(),
		CorpseExplosion1.new(),
		FleshTower1.new(),
		HealthPotionUpgrade.new(),
		DamagePotionUpgrade.new(),
		MeleeUpgrade1.new(),
		Golem1.new()
	]
	max_level = 1
	enemies_killed = 0
	time_survived = "0:00"


func pick_bones():
	if bones.size() > 0:
		var bone = bones[randi() % bones.size()]
		var pos = Vector2(bone.global_position)
		bone.remove()
		return pos
	return null
