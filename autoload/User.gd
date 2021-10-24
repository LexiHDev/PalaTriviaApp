extends Resource

class_name User
const FN = "user://save-data.json"
var user = {
	"user_name": "",
	"wins": 0,
	"pfp": load("res://assets/sprites/icon.png"),
}

func save():
	var file = File.new()
	file.open(FN, File.WRITE)
	file.store_string(to_json(User))
	file.close()
	
func load():
	var file = File.new()
	if file.file_exists(FN):
		file.open(FN, File.READ)
		var data = parse_json(file.get_as_text())
		file.close()
		if typeof(data) == TYPE_DICTIONARY:
			user = data
		else:
			printerr("Corrupted data!")
	else:
		save()
func update_user(username = user.user_name, wins = user.wins, pfp = user.pfp):
	user.user_name = username
	user.wins = wins
	user.pfp = pfp
