extends Upgrade

class_name Golem6


func _init():
	image = load("res://textures/ClayTotem.png")
	title = "Clay Totem lvl 6"
	description = "Golem has more HP and damage"
	#next_upgrade = Golem6.new()


func apply():
	var mastery = Global.player_ref.find_child("GolemMastery") as GolemMastery
	mastery.additional_damage += 20
	mastery.additional_hp += 200
