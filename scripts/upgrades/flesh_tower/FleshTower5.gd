extends Upgrade

class_name FleshTower5


func _init():
	image = load("res://textures/ZombieHand.png")
	title = "Is this a zombie hand? lvl 5"
	description = "Reduced flesh tower cooldown\nFlesh towers will live longer"
	next_upgrade = FleshTower6.new()


func apply():
	var mastery = Global.player_ref.find_child("FleshMastery") as FleshMastery
	mastery.cooldown_time -= 5
	mastery.time_to_live += 5
