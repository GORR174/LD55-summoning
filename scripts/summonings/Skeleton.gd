extends CharacterBody2D


@onready var sprite = $Sprite

var speed = 350
var target: Node2D

var damage: int = 1

func _physics_process(delta):
	if target == Global.player_ref:
		target = null
	if target == null:
		target = find_target()
		print(str(target) + " " + str(Global.enemies))
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
