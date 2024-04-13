extends Node2D


func _ready():
	get_tree().paused = true


func choosed(card: ImproveCard):
	print(card)
	get_tree().paused = false
	queue_free()
