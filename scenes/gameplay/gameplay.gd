extends Control

onready var cur_round = {
	"question": "",
	"answers": ['a', 'b', 'c', 'd'],
}

onready var size = OS.window_size
onready var maximized = false
onready var following = false
onready var dragging_start_position = Vector2()
onready var questionLabel = $Control/HSplitContainer/Panel2/MarginContainer/VSplitContainer/Panel
onready var answersContainer = $Control/HSplitContainer/Panel2/MarginContainer/VSplitContainer/Panel2/VBoxContainer
onready var userContainer =  $Control/HSplitContainer/Panel/ScrollContainer/VBoxContainer
var userScene = load("res://scenes/gameplay/User.tscn")

func _ready() -> void:
#	World.enviroment.background_mode = 0
#	World.enviroment.background_color = Color.aquamarine
	
		
	OS.set_window_title("Trivia Applet")
	OS.min_window_size = Vector2(1024, 600)
	Game.connect("questionRecieved", self, "_on_question_recieved")
	Game.connect("users_updated", self, "_on_users_update")

func _on_Resize_gui_input(event):
	if event is InputEventMouseButton:
		if event.get_button_index() == 1:
			following = true
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

func _on_question_recieved(question):
	cur_round.question = question.question.question
	
	cur_round.answers = question.question.answers 
	
	questionLabel.text = Marshalls.base64_to_utf8(cur_round.question)
	var answers = answersContainer.get_children()
	if len(cur_round.answers) == 4:
		for x in range(4):
			answers[x].text = Marshalls.base64_to_utf8(cur_round.answers[x])

func _on_users_update():
	print("Received user update signal. Clearing users")
	delete_children(userContainer)
	for user in Game.users:
		print(user)
		var userInst = userScene.instance()
		userInst.user_name = user.user_name
		userInst.pfp = user.pfp
		userInst.score = user.score
		userContainer.add_child(userInst)
		pass
			
static func delete_children(node):
	for n in node.get_children():
		node.remove_child(n)
		n.queue_free()
