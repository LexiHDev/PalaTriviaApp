tool
extends HBoxContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var texture = $TextureRect
onready var label = $VBoxContainer/Label
onready var label2 = $VBoxContainer/Label2

export var pfp: Texture
export var user_name: String = 'test'
export var score: int = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	texture.texture = pfp
	label.text = user_name
	label2.text = '%s' % score


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
