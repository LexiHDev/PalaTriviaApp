extends VBoxContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var transparency = $HBoxContainer2/CheckButton

# Called when the node enters the scene tree for the first time.
func _ready():
	transparency.pressed = true
	transparency.connect("toggled", self, "_on_CheckButton_toggled")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ColorPickerButton_color_changed(color):
	Game._set_bgColor(color)


func _on_CheckButton_toggled(_button_pressed):
	Game._toggle_transparency()
