extends Upgrade

class_name Golem2


func _init():
	image = load("res://textures/ClayTotem.png")
	title = "Clay Totem lvl 2"
	description = "Golem has more attack damage"
	next_upgrade = Golem3.new()


func apply():
	var mastery = Global.player_ref.find_child("GolemMastery") as GolemMastery
	mastery.additional_damage += 20
