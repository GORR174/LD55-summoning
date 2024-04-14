extends Upgrade

class_name CorpseExplosion6


func _init():
	image = load("res://textures/unabomber_manifesto.png")
	title = "Unabomber manifesto lvl 6"
	description = "Copse explosion deals more damage\nReduced cooldown"
	next_upgrade = CorpseExplosion7.new()


func apply():
	var mastery = Global.player_ref.find_child("CorpseExplosionMastery") as CorpseExplosionMastery
	mastery.additional_damage += 20
	mastery.cooldown_time -= 1
