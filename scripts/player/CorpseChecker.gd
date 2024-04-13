extends Node2D


@onready var skeleton_mastery = %SkeletonMastery
@onready var corpse_explosion_mastery = %CorpseExplosionMastery


func _on_timer_timeout():
	if skeleton_mastery.exec():
		return
	if corpse_explosion_mastery.exec():
		return
