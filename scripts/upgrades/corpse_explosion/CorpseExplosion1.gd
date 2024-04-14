extends Upgrade

class_name CorpseExplosion1


func _init():
	image = load("res://textures/unabomber_manifesto.png")
	title = "Unabomber manifesto lvl 1"
	description = "Now corpses can explode"
	next_upgrade = CorpseExplosion2.new()


func apply():
	var mastery = Global.player_ref.find_child("CorpseExplosionMastery") as CorpseExplosionMastery
	mastery.is_opened = true
