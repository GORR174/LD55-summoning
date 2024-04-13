extends Node


var player_ref: Node2D
var camera_ref: Camera2D
var game_ref: Node2D

var bones: Array
var enemies: Array

var enemy_spawner: Node2D


func pick_bones():
	if bones.size() > 0:
		var bone = bones[randi() % bones.size()]
		var pos = bone.global_position
		bone.remove()
		return pos
	return null
