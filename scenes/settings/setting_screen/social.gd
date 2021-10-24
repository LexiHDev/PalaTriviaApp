extends VBoxContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var username: String
var pfp: Texture
onready var userField = $"HBoxContainer2/UserField"
onready var textureButton = $"HBoxContainer/TextureButton"
onready var fileDialog = $"../FileDialog"
# Called when the node enters the scene tree for the first time.
func _ready():
	var user = User.get_user()
	userField.text = username
	pfp = user.pfp

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_profilepicture_pressed():
	pass # Replace with function body.


func _on_UserField_text_changed(new_text):
	username = new_text
