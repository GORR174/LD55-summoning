extends Upgrade

class_name DamagePotionUpgrade


func _init():
	image = load("res://textures/power_potion.png")
	title = "Power potion"
	description = "Stronger melee attack"


func apply():
	Global.player_ref.damage += 2


func set_next_upgrade():
	next_upgrade = DamagePotionUpgrade.new()
