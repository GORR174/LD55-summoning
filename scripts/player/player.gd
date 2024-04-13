extends CharacterBody2D


const SPEED = 200.0

var damage: int = 2

@onready var sprite: Sprite2D = $PlayerSprite
var current_lvl = 1
var to_next_lvl = 3
var current_xp: float = 0:
	set(value):
		current_xp = value
		if current_xp >= to_next_lvl:
			current_xp -= to_next_lvl
			current_lvl += 1
			if current_lvl < 4:
				to_next_lvl = to_next_lvl * 1.3
			else:
				to_next_lvl = to_next_lvl * 1.1
			print("LVLUP xp to next lvl: " + str(to_next_lvl))
		%LevelProgressBar.value = (current_xp / to_next_lvl * 100)
		%LevelLabel.text = "LVL: " + str(current_lvl)

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


func _on_death():
	Global.game_ref.game_over()
