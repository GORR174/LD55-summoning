extends Node2D


@onready var corpse_explosion_scene = preload("res://prefabs/particles/CorpseExplosionParticles.tscn")

var cooldown = false
var cooldown_time = 10


func exec():
	if !cooldown:
		var bones_position = Global.pick_bones()
		if bones_position == null:
			return false
		var corpse_explosion = corpse_explosion_scene.instantiate()
		corpse_explosion.position = bones_position
		Global.game_ref.add_child(corpse_explosion)
		corpse_explosion.emitting = true
		cooldown = true
		get_tree().create_timer(cooldown_time).timeout.connect(reset_cooldown)
		return true
	return false

func reset_cooldown():
	cooldown = false
