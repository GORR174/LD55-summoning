extends Upgrade

class_name Golem3


func _init():
	image = load("res://textures/ClayTotem.png")
	title = "Clay Totem lvl 3"
	description = "Golem has more health"
	next_upgrade = Golem4.new()


func apply():
	var mastery = Global.player_ref.find_child("GolemMastery") as GolemMastery
	mastery.additional_hp += 50
