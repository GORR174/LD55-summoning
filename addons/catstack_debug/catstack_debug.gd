@tool
extends EditorPlugin


const SingletonName = "CatstackDebug"


func _enter_tree():
	add_autoload_singleton(SingletonName, "res://addons/catstack_debug/debug.tscn")
	print("Catstack Debug initialized!")

func _disable_plugin():
	remove_autoload_singleton(SingletonName)
	print("Catstack Debug disabled.")
