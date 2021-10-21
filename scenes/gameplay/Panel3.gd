extends Panel

onready var following = false
onready var dragging_start_position = Vector2()
onready var maximized = false
onready var size = OS.window_size

func _on_TitleBar_gui_input(event):
	if event is InputEventMouseButton:
		if event.get_button_index() == 1:
			following = !following
			dragging_start_position = get_local_mouse_position()

func _process(_delta):
	if following:
		OS.set_window_position(OS.window_position + get_global_mouse_position() - dragging_start_position)


func _on_CloseButton_pressed():
	if OS.has_feature('HTML5'):
		JavaScript.eval("window.location.replace(\"https://twitch.tv/pala1boi\")")
	else:
		get_tree().quit()



func _on_MinimizeButton_pressed():
	OS.set_window_minimized(true)





func maxi_button_pressed():
	if OS.has_feature('HTML5'):
		JavaScript.eval("""
		function toggleFullScreen() {
		  if (!document.fullscreenElement) {
			  document.documentElement.requestFullscreen();
		  } else {
			if (document.exitFullscreen) {
			  document.exitFullscreen();
			}
		  }
		}
	""")
	if !maximized:
		OS.window_size = OS.get_screen_size() - Vector2(1, 1)
	else:
		OS.window_size = size
	maximized = !maximized
