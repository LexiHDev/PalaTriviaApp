extends MarginContainer


const blitzMode = {
	
}

var message = {
  "type": "start_game",
  "payload": {
	"rounds":1,
	"round_length":30
  }
}

onready var rounds = $social/HBoxContainer2/SpinBox
onready var round_length = $social/HBoxContainer/SpinBox2
onready var button = $social/HBoxContainer3/SpinBox2

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_SpinBox2_pressed():
	Network.sendMsg(message)


func _on_SpinBox2_value_changed(value):
	message.payload.rounds = value


func _on_SpinBox_value_changed(value):
	message.payload.round_length = value


func _on_SpinBox_item_selected(index):
	match index:
		0:
			pass
		1:
			pass
		_:
			print("ERROR, invalid index")
			return 1
	Network.sendMsg(message)