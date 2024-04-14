extends Upgrade

class_name MeleeUpgrade6


func _init():
	image = load("res://textures/regen_potion.png")
	title = "Defense potion lvl 6"
	description = "Dodge chance 30%\nHealth will regenerate faster"
	next_upgrade = MeleeUpgrade7.new()


func apply():
	Global.player_ref.dodge_chance = 0.3
	Global.player_ref.find_child("HealingSystem").regenerate_cooldown -= 1
