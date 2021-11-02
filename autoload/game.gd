# Game autoload. Use `Game` global variable as a shortcut to access
# features.
# Eg: `Game.change_scene("res://scenes/gameplay/gameplay.tscn)`
# Handles also the main game architecture when playing
# a specific scene.
extends Node

signal questionRecieved
signal users_updated

var users = [{
	"user_name": "KuraiKokor0",
	"wins": 0,
	"pfp": load("res://assets/sprites/icon.png"),
}]

var size: Vector2 setget , get_size

onready var main: Main = get_node_or_null("/root/Main")


func _set_question(question):
	emit_signal("questionRecieved", question)

func _toggle_transparency() -> void:
	print("Toggled transparency")
	get_tree().get_root().transparent_bg = !get_tree().get_root().transparent_bg
func _get_transparency() -> bool:
	return get_tree().get_root().transparent_bg

func _set_bgColor(color: Color) -> void:
	VisualServer.set_default_clear_color(color)

func _ready():
	if main == null:
		call_deferred("_force_main_scene_load")


func _force_main_scene_load():
	# Loads scenes/main.tscn and set the currently played
	# scene as ActiveSceneContainer node.
	# Needed when playing a scene which is not
	# scenes/main.tscn (eg:with Play Scene with F6)
	var played_scene = get_tree().current_scene
	var root = get_node("/root")
	main = load("res://scenes/main/main.tscn").instance()
	main.splash_transition_on_start = false
	root.remove_child(played_scene)
	root.add_child(main)
	main.active_scene_container.get_child(0).queue_free()
	main.active_scene_container.add_child(played_scene)
	if played_scene.has_method("pre_start"):
		played_scene.pre_start({})
	if played_scene.has_method("start"):
		played_scene.start()
	played_scene.owner = main


func change_scene(new_scene, params={}):
	main.change_scene(new_scene, params)


func reparent_node(node: Node2D, new_parent, update_transform = true):
	main.reparent_node(node, new_parent, update_transform)


func get_active_scene() -> Node:
	return main.get_active_scene()


func get_size():
	return main.size

func download_texture(url : String, user_name : String):
	var http = HTTPRequest.new()
	add_child(http)
	http.set_download_file('user://%s.png' % user_name)
	var err = http.request(url)
	print(err)

func update_users(new_users):
	users = []
	var userFile = File.new()
	for x in new_users:
		var texture
		if userFile.file_exists("user://"+x.user_name+".png"):
			var image = Image.new()
			var err = image.load("user://"+x.user_name+".png")
			if err != OK:
				printerr("Failed to load image at: " + "user://"+x.user_name+".png")
			texture = ImageTexture.new()
			texture.create_from_image(image)
		else:
			download_texture(x.pfpUrl, x.user_name)
			var image = Image.new()
			var err = image.load("path/to/the/image.png")
			if err != OK:
				printerr("Failed to load image at: " + "user://"+x.user_name+".png")
			texture = ImageTexture.new()
			texture.create_from_image(image)
		users.append({
			"user_name": x.user_name,
			"score": x.score,
			"pfp": texture
		})
	emit_signal("users_updated")

static func delete_children(node):
	for n in node.get_children():
		node.remove_child(n)
		n.queue_free()
