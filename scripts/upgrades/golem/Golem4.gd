extends Upgrade

class_name Golem4


func _init():
	image = load("res://textures/ClayTotem.png")
	title = "Clay Totem lvl 4"
	description = "Golem has more attack radius"
	next_upgrade = Golem5.new()


func apply():
	var mastery = Global.player_ref.find_child("GolemMastery") as GolemMastery
	mastery.additional_radius = 70
