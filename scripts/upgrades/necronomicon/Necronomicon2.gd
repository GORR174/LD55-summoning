extends Upgrade

class_name Necronomicon2


func _init():
	image = load("res://textures/necronomicon.png")
	title = "Necronomicon lvl 2"
	description = "Now you can summon 2 skeletons"
	next_upgrade = Necronomicon3.new()


func apply():
	Global.player_ref.find_child("SkeletonMastery").max_num += 1
