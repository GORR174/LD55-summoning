extends Upgrade

class_name MeleeUpgrade4


func _init():
	image = load("res://textures/regen_potion.png")
	title = "Defense potion lvl 4"
	description = "You will take less damage"
	next_upgrade = MeleeUpgrade5.new()


func apply():
	Global.player_ref.damage_substraction = 1
