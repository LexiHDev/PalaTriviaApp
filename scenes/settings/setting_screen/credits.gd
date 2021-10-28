extends ScrollContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var auto_scrolling = true
var rev_scroll = false
var old_scroll = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if auto_scrolling:
		scroll_vertical += 1 if !rev_scroll else -20
		if scroll_vertical == old_scroll:
			rev_scroll = true
		elif scroll_vertical == 0:
			rev_scroll = false
		old_scroll = scroll_vertical

func _toggle_scroll():
	print("controll scroll")
	auto_scrolling = false
