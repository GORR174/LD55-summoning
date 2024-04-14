extends Upgrade

class_name Golem1


func _init():
	image = load("res://textures/ClayTotem.png")
	title = "Clay Totem lvl 1"
	description = "You can summon a clay golem\nGolem have huge splash damage"
	next_upgrade = Golem2.new()


func apply():
	var mastery = Global.player_ref.find_child("GolemMastery") as GolemMastery
	mastery.is_opened = true
