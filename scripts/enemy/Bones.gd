extends Node2D


func remove():
	if self in Global.bones:
		Global.bones.erase(self)
	queue_free()


func _on_invisible_hider_screen_entered():
	Global.bones.append(self)


func _on_invisible_hider_screen_exited():
	Global.bones.erase(self)
