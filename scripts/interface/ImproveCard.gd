extends Node2D

class_name ImproveCard


signal choosed(card: ImproveCard)


func _on_area_2d_mouse_entered():
	var tween = create_tween()
	tween.tween_property($Container, "position:y", -80, 0.1).set_trans(Tween.TRANS_SINE)


func _on_area_2d_mouse_exited():
	var tween = create_tween()
	tween.tween_property($Container, "position:y", 0, 0.1).set_trans(Tween.TRANS_SINE)


func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed == false and event.button_index == 1:
		choosed.emit(self)
