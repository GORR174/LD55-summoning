extends CharacterBody2D


@onready var sprite = $Sprite

@export var start_speed = 300
var speed = start_speed + randf_range(-10, 50)
var target: Node2D

@export var damage: int = 10
var dodge_chance = 0.1
@export var damage_substraction = 0

func _physics_process(delta):
#	I hate myself for this code :P
	if target == Global.player_ref:
		target = null
	if target == null:
		target = find_target()
		if target == null:
			target = Global.player_ref
	velocity = (target.position - position).normalized() * speed
	
	if position.distance_to(target.position) < 40:
		velocity = Vector2.ZERO
	
	if velocity.x < 0:
		sprite.scale.x = -sprite.scale.y
	if velocity.x > 0:
		sprite.scale.x = sprite.scale.y
	
	move_and_slide()

func find_target():
	if Global.enemies.size() > 0:
		return Global.enemies[randi() % Global.enemies.size()]
	return null
