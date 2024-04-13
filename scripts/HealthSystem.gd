extends Node

class_name HealthSystem

@export var max_health: int = 100
@export var god_mode = false
@export_group("Meat")
@export var should_spawn_meat: bool = false
@export var meat_spawn_point: Node2D = null

@onready var health = max_health :
	set(value):
		health_changed.emit(value, health, max_health)
		health = value
		

var is_dead = false

signal on_death
signal health_changed(health, previous, max_health)

var meat = load("res://prefabs/meat/Meat.tscn")
var blood = load("res://prefabs/blood/Blood.tscn")


func _ready():
	health_changed.emit(health, health, max_health)


func damage(damage, damager):
	if not god_mode:
		health -= damage
	if !is_dead and health <= 0:
		is_dead = true
		on_death.emit()
		if should_spawn_meat:
			_spawn_meat(damager)
		if on_death.get_connections().size() <= 0:
			get_parent().queue_free()
		


func _spawn_meat(damager):
	var meat_position = get_parent().global_position if meat_spawn_point == null else meat_spawn_point.global_position
	
	for i in range(randi_range(4, 7)):
		var meat_instance = meat.instantiate()
		meat_instance.position = meat_position
		Global.level_ref.add_child(meat_instance)
	
	var blood_instance = blood.instantiate()
	blood_instance.position = meat_position
	blood_instance.rotation = damager.global_rotation
	Global.level_ref.add_child(blood_instance)
