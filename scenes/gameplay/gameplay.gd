extends Control

onready var size = OS.window_size
onready var maximized = false

func _ready() -> void:
	OS.set_window_title("Trivia Applet")



func _on_maximized_pressed():
	if !maximized:
		OS.window_size = OS.get_screen_size() - Vector2(1, 1)
	else:
		OS.window_size = size
	maximized = !maximized
