extends MarginContainer


var defaultCmd = {
  "cmd": "start_game",
  "game": {
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
	Network.sendMsg(defaultCmd)


func _on_SpinBox2_value_changed(value):
	defaultCmd.game.rounds = value


func _on_SpinBox_value_changed(value):
	defaultCmd.game.round_length = value
