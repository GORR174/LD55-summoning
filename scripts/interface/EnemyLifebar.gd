@tool
extends Node2D


@export var should_be_hidden = true

@onready var lifebar = $ProgressBar
@onready var timer = $ShowTimer
@onready var health_system: HealthSystem = get_parent().find_child("HealthSystem", false)
var _previous_value = 0


func _ready():
	if Engine.is_editor_hint():
		return
	if !should_be_hidden:
		show_lifebar(1)
	lifebar.max_value = health_system.max_health
	lifebar.value = health_system.health
	_previous_value = lifebar.value
	lifebar.value_changed.connect(show_lifebar)


func _process(delta):
	if Engine.is_editor_hint():
		return
	lifebar.max_value = health_system.max_health
	lifebar.value = health_system.health
	if timer.time_left < 0.2 and should_be_hidden:
		lifebar.modulate.a = timer.time_left / 0.2


func show_lifebar(value):
	lifebar.modulate.a = 1
	timer.start()


func hide_lifebar():
	return
	var tween = create_tween()
	tween.tween_property(lifebar, "modulate:a", 0, 0.2)
	await tween.finished
	lifebar.modulate.a = 0
	

func _get_configuration_warnings():
	if get_parent().find_child("HealthSystem", false) == null:
		return ["There is no HealthSystem component"]
	return []
