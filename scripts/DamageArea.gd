extends Area2D


@onready var player_damage_system = %DamageSystem
@onready var hit_player = %HitPlayer


func damage():
	for enemy in get_overlapping_bodies():
		enemy.find_child("DamageSystem").damage(owner.damage, owner)
		player_damage_system.damage(enemy.damage, enemy)
		hit_player.play()
