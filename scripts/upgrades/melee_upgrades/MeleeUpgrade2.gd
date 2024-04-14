extends Upgrade

class_name MeleeUpgrade2


func _init():
	image = load("res://textures/regen_potion.png")
	title = "Defense potion lvl 2"
	description = "Health will regenerate faster"
	next_upgrade = MeleeUpgrade3.new()


func apply():
	Global.player_ref.find_child("HealingSystem").regenerate_cooldown -= 2
