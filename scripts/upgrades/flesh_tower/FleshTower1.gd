extends Upgrade

class_name FleshTower1


func _init():
	image = load("res://textures/ZombieHand.png")
	title = "Is this a zombie hand? lvl 1"
	description = "You can summon flesh tower\nwhich will deal damage in area"
	next_upgrade = FleshTower2.new()


func apply():
	var mastery = Global.player_ref.find_child("FleshMastery") as FleshMastery
	mastery.is_opened = true
