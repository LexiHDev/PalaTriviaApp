extends MarginContainer


const blitzMode = {
	
}

var defaultCmd = {
  "type": "start_game",
  "payload": {
	"rounds":3,
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



func _on_SpinBox2_value_changed(value):
	defaultCmd.payload.rounds = value


func _on_SpinBox_value_changed(value):
	defaultCmd.payload.round_length = value


func _on_SpinBox_item_selected(index):
	
	match index:
		0:
			defaultCmd.payload = blitzMode
		1:
			defaultCmd.payload = default
		_:
			print("ERROR, invalid index")


func _on_start_game_pressed():
	Network.sendMsg(defaultCmd)
