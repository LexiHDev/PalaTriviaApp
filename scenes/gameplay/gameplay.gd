extends Control

onready var size = OS.window_size
onready var maximized = false
onready var following = false
onready var dragging_start_position = Vector2()

func _ready() -> void:
	OS.set_window_title("Trivia Applet")







func _on_Resize_gui_input(event):
	if event is InputEventMouseButton:
		if event.get_button_index() == 1:
			following = !following
			dragging_start_position = get_local_mouse_position()

func _process(_delta):
	if following:
		print(OS.get_real_window_size(), dragging_start_position)


