extends Node2D

@export var is_menu = true

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
			(button.find_child("Label") as Label).modulate = Color("f72626")
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
	get_tree().change_scene_to_packed(start_game_scene)


func _on_exit_button_pressed():
	print("exit")
	if is_menu:
		get_tree().quit()
	else:
		get_tree().change_scene_to_packed(load("res://scenes/Menu.tscn"))
