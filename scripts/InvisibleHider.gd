extends VisibleOnScreenNotifier2D


@export var view: Node2D


func _on_screen_entered():
	view.visible = true


func _on_screen_exited():
	view.visible = false
