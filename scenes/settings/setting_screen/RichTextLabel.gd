tool
extends RichTextLabel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var bbc = File.new()
	bbc.open("res://assets/credits.bbcode", File.READ)
	self.bbcode_text = bbc.get_as_text()
	bbc.close()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
