extends VBoxContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var settings = get_children()

# Called when the node enters the scene tree for the first time.
func _ready():
	for x in settings:
		print(x.connect("setting_pressed", $"../../../../../..", "_on_setting_pressed"))
		print(x, "is connected to", $"../../../../../..")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
