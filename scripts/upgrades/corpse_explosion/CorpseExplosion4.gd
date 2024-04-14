extends Upgrade

class_name CorpseExplosion4


func _init():
	image = load("res://textures/unabomber_manifesto.png")
	title = "Unabomber manifesto lvl 4"
	description = "Bigger corpse explosion radius"
	next_upgrade = CorpseExplosion5.new()


func apply():
	var mastery = Global.player_ref.find_child("CorpseExplosionMastery") as CorpseExplosionMastery
	mastery.additional_radius = 50
