extends Upgrade

class_name Golem5


func _init():
	image = load("res://textures/ClayTotem.png")
	title = "Clay Totem lvl 5"
	description = "Golem have more HP and damage"
	next_upgrade = Golem6.new()


func apply():
	var mastery = Global.player_ref.find_child("GolemMastery") as GolemMastery
	mastery.additional_damage += 10
	mastery.additional_hp += 100
