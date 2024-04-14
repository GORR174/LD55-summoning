extends Upgrade

class_name Necronomicon5


func _init():
	image = load("res://textures/necronomicon.png")
	title = "Necronomicon lvl 5"
	description = "Redused spawn cooldown"
	next_upgrade = Necronomicon6.new()


func apply():
	var mastery = Global.player_ref.find_child("SkeletonMastery") as SkeletonMastery
	mastery.cooldown_time -= 2
