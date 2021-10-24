
onready var dragging_start_position: Vector2
onready var following = false


func _ready() -> void:
	
	OS.set_window_title("Trivia Applet")
	OS.min_window_size = Vector2(1024, 600)

func _on_Resize_gui_input(event):
	if event is InputEventMouseButton:
		if event.get_button_index() == 1:
			following = !true
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			dragging_start_position = OS.window_size
			
func _notification(notif):
	match notif:
		NOTIFICATION_WM_FOCUS_OUT:
			following = false
			Input.set_mouse_mode(0)

func _input(event):
	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event is InputEventMouseButton:
			print("is mousebutton")
			if event.get_button_index() == 1:
				print("is click")
				following = false
				Input.set_mouse_mode(0)
				get_viewport().warp_mouse(OS.window_size )
		elif event is InputEventMouseMotion:
			var new = (OS.window_size + event.relative)
			var x = max(new.x, 1024) 
			var y = max(new.y, 600)
			
			OS.window_size = Vector2(x, y)
