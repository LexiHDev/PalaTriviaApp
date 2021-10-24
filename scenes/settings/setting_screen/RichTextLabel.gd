tool
extends RichTextLabel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var bbcode = load("res://assets/credits.tres")
	bbcode_text = bbcode
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
