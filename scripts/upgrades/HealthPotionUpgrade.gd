extends Upgrade

class_name HealthPotionUpgrade


func _init():
	image = load("res://textures/heal_potion.png")
	title = "Heal potion"
	description = "Gives you 20% HP"


func apply():
	Global.player_ref.find_child("HealthSystem").health += 20


func set_next_upgrade():
	next_upgrade = HealthPotionUpgrade.new()
