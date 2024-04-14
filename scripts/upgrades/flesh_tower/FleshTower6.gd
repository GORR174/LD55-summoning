extends Upgrade

class_name FleshTower6


func _init():
	image = load("res://textures/ZombieHand.png")
	title = "Is this a zombie hand? lvl 6"
	description = "Reduced flesh tower cooldown\nFlesh towers will live longer"
	next_upgrade = FleshTower7.new()


func apply():
	var mastery = Global.player_ref.find_child("FleshMastery") as FleshMastery
	mastery.cooldown_time -= 10
	mastery.time_to_live += 5
