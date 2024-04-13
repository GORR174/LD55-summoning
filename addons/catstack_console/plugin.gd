@tool
extends EditorPlugin

const SingletonName = "Panku"

func _enter_tree():
	add_autoload_singleton(SingletonName, "res://addons/catstack_console/console.tscn")
	print("Catstack Console initialized! Powered by Panku Console. Original project page: https://github.com/Ark2000/PankuConsole")

func _disable_plugin():
	remove_autoload_singleton(SingletonName)
	print("Catstack Console disabled.")
