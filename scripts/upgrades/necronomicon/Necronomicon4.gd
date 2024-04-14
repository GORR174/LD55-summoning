extends Upgrade

class_name Necronomicon4


func _init():
	image = load("res://textures/necronomicon.png")
	title = "Necronomicon lvl 4"
	description = "Now you can summon 3 skeletons"
	next_upgrade = Necronomicon5.new()


func apply():
	var mastery = Global.player_ref.find_child("SkeletonMastery") as SkeletonMastery
	mastery.max_num = 3
