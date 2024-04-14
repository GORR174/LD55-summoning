extends Upgrade

class_name CorpseExplosion5


func _init():
	image = load("res://textures/unabomber_manifesto.png")
	title = "Unabomber manifesto lvl 5"
	description = "Cooldown reduced\nNow you blow up two corpses at once"
	next_upgrade = CorpseExplosion6.new()


func apply():
	var mastery = Global.player_ref.find_child("CorpseExplosionMastery") as CorpseExplosionMastery
	mastery.cooldown_time -= 1
	mastery.corpse_count = 2
