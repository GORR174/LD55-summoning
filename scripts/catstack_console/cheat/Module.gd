class_name CatstackModuleCheat extends PankuModule

func god():
	var p_health = Global.player_ref.get_node("HealthSystem")
	p_health.god_mode = !p_health.god_mode
	
	core.notify("God mode " + ("enabled" if p_health.god_mode else "disabled"))

