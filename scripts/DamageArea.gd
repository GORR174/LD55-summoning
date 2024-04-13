extends Area2D


@onready var player_damage_system = %DamageSystem


func damage():
	for enemy in get_overlapping_bodies():
		enemy.find_child("DamageSystem").damage(owner.damage, owner)
		player_damage_system.damage(enemy.damage, enemy)
