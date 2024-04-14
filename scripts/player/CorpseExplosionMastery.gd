extends Node2D

class_name CorpseExplosionMastery


@onready var corpse_explosion_scene = preload("res://prefabs/particles/CorpseExplosionParticles.tscn")

var cooldown = false
var cooldown_time = 10
var is_opened = false

var additional_damage = 0
var additional_radius = 0
var corpse_count = 1


func exec():
	if is_opened and !cooldown:
		for i in range(0, corpse_count):
			var bones_position = Global.pick_bones()
			if bones_position == null and i == 0:
				return false
			print("corpse " + str(i))
			var corpse_explosion = corpse_explosion_scene.instantiate()
			corpse_explosion.position = bones_position
			corpse_explosion.damage += additional_damage
			var collision = corpse_explosion.find_child("CollisionShape2D") as CollisionShape2D
			collision.shape.radius += additional_radius
			Global.game_ref.add_child(corpse_explosion)
			corpse_explosion.emitting = true
			cooldown = true
			get_tree().create_timer(cooldown_time, false).timeout.connect(reset_cooldown)
		return true
	return false

func reset_cooldown():
	cooldown = false
