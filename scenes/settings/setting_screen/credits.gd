extends ScrollContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var auto_scrolling = true
var rev_scroll = false
var old_scroll = 0
var tween = Tween.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(tween)
	tween.interpolate_property(
		self, "scroll_veritcal", 
		old_scroll, 0, 1,
		Tween.TRANS_QUAD, Tween.EASE_IN)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	scroll_vertical += 1 if !rev_scroll else -20
	if scroll_vertical == old_scroll:
		rev_scroll = true
	elif scroll_vertical == 0:
		rev_scroll = false
	old_scroll = scroll_vertical
