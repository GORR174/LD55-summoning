extends ModuleOptions

@export_group("cheats")

@export var export_button_god_mode := "God Mode"
func god_mode():
	_module.god()
