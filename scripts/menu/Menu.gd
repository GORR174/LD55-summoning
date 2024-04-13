extends Node2D


var group = ButtonGroup.new()

@onready var play_button: TextureButton = %PlayButton
@onready var exit_button: TextureButton = %ExitButton

@onready var start_game_scene: PackedScene = preload("res://scenes/GameScene.tscn")
#@onready var audio_stream_player: AudioStreamPlayer2D = $AudioStreamPlayer2D


func _ready():
	play_button.set_button_group(group)
	exit_button.set_button_group(group)
	play_button.grab_focus()


func _process(delta):
	if Input.is_action_just_pressed("ui_down"):
		_enter_next_button(group.get_pressed_button())
	if Input.is_action_just_pressed("ui_up"):
		_enter_previous_button(group.get_pressed_button())
	
	for button in group.get_buttons():
		if button.button_pressed and button.scale.x < 1.1:
			button.scale.x = clamp(button.scale.x + delta, 1, 1.2)
			button.scale.y = clamp(button.scale.y + delta, 1, 1.2)
			(button.find_child("Label") as Label).modulate = Color.ORANGE_RED
		if !button.button_pressed and button.scale.x > 1:
			button.scale.x = clamp(button.scale.x - delta, 1, 1.2)
			button.scale.y = clamp(button.scale.y - delta, 1, 1.2)
			(button.find_child("Label") as Label).modulate = Color.WHITE

func _enter_next_button(current_button):
	if current_button == play_button:
		_on_exit_button_mouse_entered()


func _enter_previous_button(current_button):
	if current_button == exit_button:
		_on_play_button_mouse_entered()


func _on_play_button_mouse_entered():
	#audio_stream_player.play()
	play_button.button_pressed = true
	play_button.grab_focus()



func _on_exit_button_mouse_entered():
	#audio_stream_player.play()
	exit_button.button_pressed = true
	exit_button.grab_focus()


func _on_play_button_pressed():
	print("start game")
	#await bg_tween_in()
	get_tree().change_scene_to_packed(start_game_scene)


#func bg_tween_in():
	#var bg_tween_in = get_tree().create_tween()
	#bg_tween_in.tween_property($Control/BlackRect, "color:a", 1, 0.4)
	#await bg_tween_in.finished
	#$Control/BlackRect.color.a = 1.0


func _on_exit_button_pressed():
	print("exit")
	get_tree().quit()
