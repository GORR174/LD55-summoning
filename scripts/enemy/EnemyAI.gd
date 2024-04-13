extends CharacterBody2D


var speed = 50 + randf_range(-10, 50)
var flip_range = randf_range(2, 20)

@export var damage: int = 5
@export var lvl: int = 1

@onready var sprite: Sprite2D = $Sprite


func _process(delta):
	if Global.player_ref.position.x - position.x < -flip_range:
		sprite.scale.x = -sprite.scale.y
	if Global.player_ref.position.x - position.x > flip_range:
		sprite.scale.x = sprite.scale.y


func _physics_process(delta):
	velocity = (Global.player_ref.position - position).normalized() * speed
	move_and_slide()


func kill():
	Global.player_ref.current_xp += lvl
	_on_visible_on_screen_notifier_2d_screen_exited()


func _on_visible_on_screen_notifier_2d_screen_exited():
	Global.enemies.erase(self)
	queue_free()


func _on_show():
	Global.enemies.append(self)


func _on_hide():
	Global.enemies.erase(self)
