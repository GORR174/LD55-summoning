extends Node2D


var force_y = 400



func _process(delta):
	if force_y > 0:
		translate(Vector2.UP * delta * force_y)
		force_y -= delta * 400
	elif force_y < 0:
		force_y = 0
	else:
		$Label.modulate.a -= delta
		if $Label.modulate.a <= 0:
			queue_free()


func set_damage(damage):
	$Label.text = str(damage)
