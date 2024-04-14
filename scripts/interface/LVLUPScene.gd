extends Node2D


@onready var cards = [$ImproveCard, $ImproveCard2, $ImproveCard3]


func _ready():
	get_tree().paused = true
	for card in cards:
		send_update_to_card(card)


func send_update_to_card(card):
	if Global.upgrades.size() > 0:
		var upgrade = Global.upgrades.pick_random()
		card.set_upgrade(upgrade)
		Global.upgrades.erase(upgrade)
	else:
		card.set_upgrade(EmptyUpgrade.new())


func choosed(card: ImproveCard):
	print(card)
	if card.upgrade.next_upgrade != null:
		Global.upgrades.append(card.upgrade.next_upgrade)
	for _card in cards:
		if (card != _card) and !(_card.upgrade is EmptyUpgrade):
			Global.upgrades.append(_card.upgrade)
	card.upgrade.apply()
	get_tree().paused = false
	queue_free()
