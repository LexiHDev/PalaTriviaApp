extends Node

#const FN = "user://save-data.json"
var user_name: String = "KuraiKokor0"
#
#func save():
#	var file = File.new()
#	file.open(FN, File.WRITE)
#	file.store_string(to_json({"user": user_name}))
#	file.close()
#
#func load():
#	var file = File.new()
#	if file.file_exists(FN):
#		file.open(FN, File.READ)
#		var data = parse_json(file.get_as_text())
#		file.close()
#		if typeof(data) == TYPE_STRING:
#			user_name = data
#		else:
#			printerr("Corrupted data!")
#	else:
#		save()
#
