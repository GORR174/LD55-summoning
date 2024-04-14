extends Upgrade

class_name CorpseExplosion3


func _init():
	image = load("res://textures/unabomber_manifesto.png")
	title = "Unabomber manifesto lvl 3"
	description = "Copse explosion deals more damage"
	next_upgrade = CorpseExplosion4.new()


func apply():
	var mastery = Global.player_ref.find_child("CorpseExplosionMastery") as CorpseExplosionMastery
	mastery.additional_damage += 20
