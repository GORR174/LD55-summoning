extends CharacterBody2D


@onready var sprite: Sprite2D = $PlayerSprite
@onready var level_progress_bar = %LevelProgressBar
@onready var level_label = %LevelLabel
@onready var levelup_sound = %lvlupPlayer
@onready var lvlup_screen_scene = preload("res://prefabs/interface/lvlup/LVLUP.tscn")

const SPEED = 200.0

var damage: int = 20
var dodge_chance = 0.0
var damage_substraction = 0

var current_lvl = 1
var to_next_lvl = 3

var current_xp: float = 0:
	set(value):
		Global.enemies_killed += 1
		current_xp = value
		if current_xp >= to_next_lvl:
			current_xp -= to_next_lvl
			current_lvl += 1
			Global.max_level = current_lvl
			if current_lvl < 4:
				to_next_lvl = to_next_lvl * 1.3
			elif current_lvl < 10:
				to_next_lvl = to_next_lvl * 1.2
			elif current_lvl < 20:
				to_next_lvl = to_next_lvl * 1.1
			elif current_lvl < 28:
				to_next_lvl = to_next_lvl * 1.03
			else:
				to_next_lvl = to_next_lvl * 1.01
			levelup_sound.play()
			var lvlup_screen = lvlup_screen_scene.instantiate()
			lvlup_screen.position = Vector2(-1920 / 2, -1080 / 2)
			Global.camera_ref.add_child(lvlup_screen)
			print("LVLUP xp to next lvl: " + str(to_next_lvl))
		level_progress_bar.value = (current_xp / to_next_lvl * 100)
		level_label.text = "LVL: " + str(current_lvl)

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
	$PlayerSprite.queue_free()
	process_mode = Node.PROCESS_MODE_DISABLED
	var tween = get_tree().create_tween()
	tween.tween_property($Camera2D/LoseRect, "color:a", 1, 0.8).set_trans(Tween.TRANS_SINE)
	await tween.finished
	get_parent().game_over()
	#get_tree().paused = true
