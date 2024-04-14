extends Node2D


@onready var skeleton_mastery = %SkeletonMastery
@onready var corpse_explosion_mastery = %CorpseExplosionMastery
@onready var flesh_mastery = %FleshMastery
@onready var golem_mastery = %GolemMastery


func _on_timer_timeout():
	if golem_mastery.exec():
		return
	if skeleton_mastery.exec():
		return
	if flesh_mastery.exec():
		return
	if corpse_explosion_mastery.exec():
		return
