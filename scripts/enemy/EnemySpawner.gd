extends Area2D


@onready var _children = get_children()


func _ready():
	Global.enemy_spawner = self
	#for i in range(0, 1000):
		#spawn_enemy()


func spawn_enemy(count):
	for i in count:
		var child = _children[randi() % _children.size()] as CollisionShape2D
		var rect = child.shape as RectangleShape2D
		
		var rand_x = randi_range(child.position.x - rect.size.x / 2, child.position.x + rect.size.x / 2)
		var rand_y = randi_range(child.position.y - rect.size.y / 2, child.position.y + rect.size.y / 2)
		
		var enemy = load("res://prefabs/enemy/Enemy.tscn").instantiate()
		enemy.position = to_global(Vector2(rand_x, rand_y))
		Global.game_ref.add_child.call_deferred(enemy)
	
	var time = Global.timer_ref
	if time.minutes < 1 and time.seconds < 20:
		get_tree().create_timer(4, false).timeout.connect(spawn_enemy.bind(1))
	elif time.minutes < 1:
		get_tree().create_timer(4, false).timeout.connect(spawn_enemy.bind(2))
	elif time.minutes < 2:
		get_tree().create_timer(3, false).timeout.connect(spawn_enemy.bind(2))
	elif time.minutes < 3:
		get_tree().create_timer(3, false).timeout.connect(spawn_enemy.bind(4))
	elif time.minutes < 4:
		get_tree().create_timer(2, false).timeout.connect(spawn_enemy.bind(3))
	elif time.minutes < 5:
		get_tree().create_timer(2, false).timeout.connect(spawn_enemy.bind(4))
	elif time.minutes < 10:
		get_tree().create_timer(2, false).timeout.connect(spawn_enemy.bind(4))
