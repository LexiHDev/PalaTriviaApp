tool
extends Panel

signal setting_pressed
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(Texture) var texture
export(String) var label
# Called when the node enters the scene tree for the first time.
func _ready():
	$ToolButton.icon = texture
	$ToolButton.text = label.to_upper()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TextureRect_pressed():
	print("buttonPressed", label.to_lower())
	emit_signal("setting_pressed", label.to_lower())
