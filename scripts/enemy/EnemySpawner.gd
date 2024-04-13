extends Area2D


@onready var _children = get_children()


func _ready():
	Global.enemy_spawner = self
	#for i in range(0, 1000):
		#spawn_enemy()


func spawn_enemy():
	for i in range(0, 1000):
		var child = _children[randi() % _children.size()] as CollisionShape2D
		var rect = child.shape as RectangleShape2D
		
		var rand_x = randi_range(child.position.x - rect.size.x / 2, child.position.x + rect.size.x / 2)
		var rand_y = randi_range(child.position.y - rect.size.y / 2, child.position.y + rect.size.y / 2)
		
		var enemy = load("res://prefabs/enemy/Enemy.tscn").instantiate()
		enemy.position = to_global(Vector2(rand_x, rand_y))
		Global.game_ref.add_child.call_deferred(enemy)
