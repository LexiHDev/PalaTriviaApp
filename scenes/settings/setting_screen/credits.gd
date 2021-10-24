extends ScrollContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var auto_scrolling = true
var old_scroll = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	scroll_vertical += 1
	if scroll_vertical == old_scroll:
		scroll_vertical = 0
