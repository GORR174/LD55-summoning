extends Area2D


@onready var player_damage_system = %DamageSystem
@onready var hit_player = %HitPlayer
@onready var blood_scene = preload("res://prefabs/particles/Blood.tscn")

var _can_hit = true


func damage():
	_can_hit = true
	for enemy in get_overlapping_bodies():
		enemy.find_child("DamageSystem").damage(owner.damage, owner)
		if _can_hit:
			player_damage_system.damage(enemy.damage, enemy)
			_can_hit = false
		hit_player.play()
		var blood = blood_scene.instantiate() as CPUParticles2D
		blood.position = (global_position + enemy.global_position) / 2
		owner.get_parent().add_child(blood)
		blood.emitting = true
		#blood.restart()
