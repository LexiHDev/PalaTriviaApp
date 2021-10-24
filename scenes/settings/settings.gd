tool
extends Control

onready var size = OS.window_size
onready var maximized = false
onready var following = false
onready var dragging_start_position = Vector2()



func switch_to_setting(setting: String):
	print("setting pressed:", setting)
	pass


func _on_setting_pressed(setting):
	print("pressed!")
	switch_to_setting(setting)


