extends Label


func _ready():
	text = "v" + str(ProjectSettings.get_setting("application/config/version"))
