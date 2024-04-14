extends Sprite2D


func _ready():
	if randf() < .15:
		texture = Global.decorations.pick_random()
