extends VBoxContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var userField = $"HBoxContainer2/UserField"
onready var textureButton = $"HBoxContainer/Panel/TextureButton"
var user_name = "Guest" setget set_username, get_username
# Called when the node enters the scene tree for the first time.
func _ready():
	Network.connect("register_complete", self, "set_pfp")
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass 

func set_username(username):
	user_name = userField.text
	User.user_name = user_name
	Network.register()

var http = HTTPRequest.new()
func download_texture(url : String):
#	add_child(http)
#	http.connect("request_completed", self, "_profile_download_completed")
#	http.set_download_file('user://profilePicture.png')
#	var err = http.request(url)
#	if err != OK:
#		printerr("err: idk")
#	else:
#		print("Pfp downloaded")
	pass
	
func set_pfp(pfp: String):
	pass
	download_texture(pfp)
	yield(http, "request_completed")
	print("completed")
	var userFile = File.new()
	var image = Image.new()
	var texture
	var err = image.load("user://profilePicture.png")
	if err != OK:
		printerr("Failed to load image at: " + "user://profilePicture.png")
	texture = ImageTexture.new()
	texture.create_from_image(image)
	textureButton.texture_normal = texture


func get_username():
	return user_name

func set_user():
	userField.text = user_name
#	textureButton.texture_normal = user.pfp

func _on_Button_pressed():
	print("Button pressed...")
	set_username('')
	pass # Replace with function body.
