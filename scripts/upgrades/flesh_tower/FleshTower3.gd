extends Upgrade

class_name FleshTower3


func _init():
	image = load("res://textures/ZombieHand.png")
	title = "Is this a zombie hand? lvl 3"
	description = "Flesh towers will live longer"
	next_upgrade = FleshTower4.new()


func apply():
	var mastery = Global.player_ref.find_child("FleshMastery") as FleshMastery
	mastery.time_to_live += 5
