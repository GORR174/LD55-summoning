extends Upgrade

class_name FleshTower4


func _init():
	image = load("res://textures/ZombieHand.png")
	title = "Is this a zombie hand? lvl 4"
	description = "Flesh towers deals more damage"
	next_upgrade = FleshTower5.new()


func apply():
	var mastery = Global.player_ref.find_child("FleshMastery") as FleshMastery
	mastery.additional_damage += 2
