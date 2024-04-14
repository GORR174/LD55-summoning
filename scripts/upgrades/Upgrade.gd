extends Node

class_name Upgrade

var next_upgrade: Upgrade
var title: String
var description: String
var image: CompressedTexture2D

func _init(_title, _description, _image, _next_upgrade):
	title = _title
	description = _description
	image = _image
	next_upgrade = _next_upgrade


func apply():
	pass
