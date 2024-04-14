extends Upgrade

class_name MeleeUpgrade1


func _init():
	image = load("res://textures/regen_potion.png")
	title = "Defense potion lvl 1"
	description = "Dodge chance 10%"
	next_upgrade = MeleeUpgrade2.new()


func apply():
	Global.player_ref.dodge_chance = 0.1

