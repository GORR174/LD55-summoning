extends Upgrade

class_name FleshTower7


func _init():
	image = load("res://textures/ZombieHand.png")
	title = "Is this a zombie hand? lvl 7"
	description = "Flesh towers deal more damage"
	#next_upgrade = FleshTower3.new()


func apply():
	var mastery = Global.player_ref.find_child("FleshMastery") as FleshMastery
	mastery.additional_damage += 3
