extends CharacterBody2D


const SPEED = 300.0

@onready var sprite: Sprite2D = $PlayerSprite


func _ready():
	Global.player_ref = self
	Global.camera_ref = $Camera2D


func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * SPEED
	
	if (direction.x < 0):
		sprite.scale.x = -sprite.scale.y
	if (direction.x > 0):
		sprite.scale.x = sprite.scale.y

	move_and_slide()
