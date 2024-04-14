extends Upgrade

class_name Necronomicon6


func _init():
	image = load("res://textures/necronomicon.png")
	title = "Necronomicon lvl 6"
	description = "Your skeletons deal more damage\nand have more health"
	#next_upgrade = Necronomicon7.new()


func apply():
	var mastery = Global.player_ref.find_child("SkeletonMastery") as SkeletonMastery
	mastery.additional_hp = 150
	mastery.additional_damage = 10
