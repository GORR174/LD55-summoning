extends Node2D


const chunk_scene = preload("res://prefabs/Chunk.tscn")

var chunk_size: int = 2048
var chunks: Dictionary = {}


func chunk_update(chunk):
	var pos = chunk.global_position
	var key = str(pos.x) + "," + str(pos.y)
	if !chunks.has(key):
		chunks[key] = chunk
	for x in range(-1, 2):
		for y in range(-1, 2):
			add_chunk(pos.x + chunk_size * x, pos.y + chunk_size * y)


func add_chunk(x, y):
	var key: String = str(x) + "," + str(y)

	if chunks.has(key):
		return
	var new_chunk = chunk_scene.instantiate()
	new_chunk.global_position = Vector2(x, y)
	add_child.call_deferred(new_chunk)
	chunks[key] = new_chunk
