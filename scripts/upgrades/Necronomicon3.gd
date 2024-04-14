extends Upgrade

class_name Necronomicon3


func _init():
	image = load("res://textures/necronomicon.png")
	title = "Necronomicon lvl 3"
	description = "Your skeletons deal more damage\nand have more health"
	next_upgrade = Necronomicon4.new()


func apply():
	var mastery = Global.player_ref.find_child("SkeletonMastery") as SkeletonMastery
	mastery.additional_hp = 50
	mastery.additional_damage = 5
