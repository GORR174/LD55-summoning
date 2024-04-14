extends Node2D


@onready var next_scene: PackedScene = load("res://scenes/GameOver.tscn")


func _ready():
	Global.bones.clear()
	Global.enemies.clear()
	Global.reset()
	Global.game_ref = self
	spawn_enemy()


func spawn_enemy():
	Global.enemy_spawner.spawn_enemy(2)


func game_over():
	get_tree().change_scene_to_packed(next_scene)
