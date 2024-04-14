extends Node2D

class_name Chunk


func _on_area_2d_body_entered(body):
	get_parent().chunk_update(self)
