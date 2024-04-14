extends Upgrade

class_name MeleeUpgrade3


func _init():
	image = load("res://textures/regen_potion.png")
	title = "Defense potion lvl 3"
	description = "Dodge chance 20%"
	next_upgrade = MeleeUpgrade4.new()


func apply():
	Global.player_ref.dodge_chance = 0.2
