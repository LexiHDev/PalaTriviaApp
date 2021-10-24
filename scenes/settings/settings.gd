tool
extends Control

onready var size = OS.window_size
onready var maximized = false
onready var following = false
onready var dragging_start_position = Vector2()
onready var current = 'video'

var settings_screens = {}


func _ready():
	var childr = $Control/HSplitContainer/bg/margins/curSetting.get_children()
	for x in childr:
		settings_screens[x.name] = x
	print(settings_screens)
func switch_to_setting(setting: String):
	print("setting pressed:", setting)
	settings_screens[current].visible = false
	settings_screens[setting].visible = true
	current = setting
	

func _on_setting_pressed(setting):
	print("pressed!")
	switch_to_setting(setting)


