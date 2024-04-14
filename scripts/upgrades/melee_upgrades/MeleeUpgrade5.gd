extends Upgrade

class_name MeleeUpgrade5


func _init():
	image = load("res://textures/regen_potion.png")
	title = "Defense potion lvl 5"
	description = "Health will regenerate faster"
	next_upgrade = MeleeUpgrade6.new()


func apply():
	Global.player_ref.find_child("HealingSystem").regenerate_cooldown -= 1
