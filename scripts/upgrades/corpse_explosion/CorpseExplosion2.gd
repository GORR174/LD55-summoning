extends Upgrade

class_name CorpseExplosion2


func _init():
	image = load("res://textures/unabomber_manifesto.png")
	title = "Unabomber manifesto lvl 2"
	description = "Reduced corpse explosion cooldown"
	next_upgrade = CorpseExplosion3.new()


func apply():
	var mastery = Global.player_ref.find_child("CorpseExplosionMastery") as CorpseExplosionMastery
	mastery.cooldown_time -= 1
