tool
extends RichTextLabel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func load_text_file(path):
	var f = File.new()
	var err = f.open(path, File.READ)
	if err != OK:
		printerr("Could not open file, error code ", err)
		return ""
	var text = f.get_as_text()
	f.close()
	return text


# Called when the node enters the scene tree for the first time.
func _ready():
	var text = load_text_file("res://assets/credits.txt")
	bbcode_text = text
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
