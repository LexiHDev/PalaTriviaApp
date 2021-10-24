extends VBoxContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var username: String
var pfp: Texture

# Called when the node enters the scene tree for the first time.
func _ready():
	user = User.get_user()
	username = user.username
	pfp = user.pfp
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
