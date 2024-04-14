extends Upgrade

class_name FleshTower2


func _init():
	image = load("res://textures/ZombieHand.png")
	title = "Is this a zombie hand? lvl 2"
	description = "Reduced flesh tower cooldown"
	next_upgrade = FleshTower3.new()


func apply():
	var mastery = Global.player_ref.find_child("FleshMastery") as FleshMastery
	mastery.cooldown_time -= 5
