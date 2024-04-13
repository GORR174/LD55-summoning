extends Area2D


@export var one_shot = false

var _contains_player = false

signal action()

var is_destroying = false


func _process(delta):
	if Input.is_action_just_pressed("action") && _contains_player && !is_destroying:
		action.emit()
		if one_shot:
			is_destroying = true
			queue_free()


func _on_body_entered(body):
	if body == Global.player_ref:
		_contains_player = true


func _on_body_exited(body):
	if body == Global.player_ref:
		_contains_player = false
