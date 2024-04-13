@tool
extends Node

class_name DamageSystem


@export var blink_object: Node2D
@export_group("Custom")
@export var damage_label_postition: Node2D
@export var health_system: Node:
	set(value):
		health_system = value
		update_configuration_warnings()

signal damaged(damage: int, damager: Node2D)

var damage_label = load("res://prefabs/damage_label/DamageLabel.tscn")

var blinking = 0.0


func _get_configuration_warnings():
	if health_system == null and get_parent().find_child("HealthSystem", false) == null:
		return ["There is no HealthSystem component"]
	return []


func _ready():
	if !Engine.is_editor_hint():
		if health_system == null:
			health_system = get_parent().find_child("HealthSystem", false)


func _process(delta):
	if Engine.is_editor_hint():
		return
	if blinking > 0:
		blinking -= delta * 4
	elif blinking < 0:
		blinking = 0
	if blink_object != null:
		blink_object.get_material().set_shader_parameter("whitening", blinking)


func damage(damage: int, damager: Node2D):
	health_system.damage(damage, damager)
	damaged.emit(damage, damager)
	#spawn_damage_label(damage)
	blinking = 0.8
	

func spawn_damage_label(damage: int):
	var label_position = owner.global_position \
			if damage_label_postition == null \
			else damage_label_postition.global_position
	
	var damage_label_instance = damage_label.instantiate()
	damage_label_instance.position = label_position + Vector2(randi_range(-30, 30), -20 + randi_range(-50, 0))
	damage_label_instance.set_damage(damage)
	get_tree().current_scene.add_child(damage_label_instance)
