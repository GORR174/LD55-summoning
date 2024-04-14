@tool
extends Node

class_name HealingSystem


@export_group("Custom")
@export var health_system: Node:
	set(value):
		health_system = value
		update_configuration_warnings()


func _get_configuration_warnings():
	if health_system == null and get_parent().find_child("HealthSystem", false) == null:
		return ["There is no HealthSystem component"]
	return []


func _ready():
	if !Engine.is_editor_hint():
		if health_system == null:
			health_system = get_parent().find_child("HealthSystem", false)
	get_tree().create_timer(8, false).timeout.connect(_heal)


func _process(delta):
	if Engine.is_editor_hint():
		return


func _heal():
	health_system.health += 1
	get_tree().create_timer(8, false).timeout.connect(_heal)

