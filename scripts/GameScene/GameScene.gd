extends Node2D


@onready var next_scene: PackedScene = load("res://scenes/Menu.tscn")


func _ready():
	Global.game_ref = self


func spawn_enemy():
	Global.enemy_spawner.spawn_enemy()


func game_over():
	get_tree().change_scene_to_packed(next_scene)
