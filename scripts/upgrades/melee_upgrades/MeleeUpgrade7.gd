extends Upgrade

class_name MeleeUpgrade7


func _init():
	image = load("res://textures/regen_potion.png")
	title = "Defense potion lvl 7"
	description = "Dodge chance 40%\nYou will take less damage"
	#next_upgrade = MeleeUpgrade3.new()


func apply():
	Global.player_ref.dodge_chance = 0.4
	Global.player_ref.damage_substraction = 2
