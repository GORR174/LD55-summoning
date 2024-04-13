extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.game_ref = self


func spawn_enemy():
	Global.enemy_spawner.spawn_enemy()
