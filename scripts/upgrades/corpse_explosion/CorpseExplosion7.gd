extends Upgrade

class_name CorpseExplosion7


func _init():
	image = load("res://textures/unabomber_manifesto.png")
	title = "Unabomber manifesto lvl 7"
	description = "Reduced copse explosion cooldown"
	#next_upgrade = Necronomicon3.new()


func apply():
	var mastery = Global.player_ref.find_child("CorpseExplosionMastery") as CorpseExplosionMastery
	mastery.cooldown_time -= 2
