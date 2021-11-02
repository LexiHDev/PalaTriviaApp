extends Node

const PORT: int = 80
const URL: String = "wss://pala-trivia.herokuapp.com/:%s" % PORT

var client: WebSocketClient
var pingTimer: Timer

func _ready() -> void:
	client = WebSocketClient.new()
	var err := client.connect("data_received", self, "_on_received_data")
	if err != OK:
		printerr(err)
	err = client.connect("connection_established", self, "_on_connected")
	if err != OK:
		printerr(err)
	client.connect_to_url(URL)
	pingTimer = Timer.new()
	pingTimer.wait_time = 5
	pingTimer.connect("timeout", self, "_ping")
	pingTimer.autostart = true
	add_child(pingTimer)
func _on_connected(_protocol: String) -> void:
	register()

func register():
	print("Registering with user:")
	print("--------------------")
	var message = {
		"type": "register",
		"payload": {
			"user": User.user_name
		}
	}
	# print(JSON.print(message, "\t", true))
	# // Here we'll convert the message object to a PoolByteArray, by generating 
		# // a string from the object and then using the String method 'to_utf8()'
	var packet: PoolByteArray = JSON.print(message).to_utf8()
	# // .get_peer(1) is called to get the connected server peer.
	client.get_peer(1).put_packet(packet)
	
func sendMsg(data) -> void:
	var err = client.get_peer(1).put_packet(JSON.print(data).to_utf8())
	
	if err != OK:
		printerr("Error, client couldn't send:\n", JSON.print(data, "\t"), "\n", err)

func _on_received_data() -> void:
	var packet: PoolByteArray = client.get_peer(1).get_packet()
	var temp = packet.get_string_from_utf8()
	var parsed_data: Dictionary = JSON.parse(packet.get_string_from_utf8()).result
	print(JSON.print(parsed_data, "\t", true))
	if parsed_data.has('type'):
		if parsed_data.type == "trivia_question":
#			Game._set_question(parsed_data)
			trivia_question(parsed_data.payload)
		if parsed_data.type == 'user_update':
#			Game.update_users(parsed_data.payload)
			user_update(parsed_data.payload)
		if parsed_data.type == "registered":
			register_complete(parsed_data.payload)
	else:
		printerr("Server responded with bad message.")

func trivia_question(payload):
	Game.set_question({ "question": payload.question, "answers": payload.answers})
	Game.set_users({"users": payload.users})
	pass
	
func user_update(payload):
	pass


signal register_complete
func register_complete(payload):
	emit_signal("register_complete", payload.pfpUrl)
		
func _process(_delta: float) -> void:
#	print('process')
	client.poll()

func _ping():
	client.get_peer(1).put_packet(PoolByteArray(JSON.print({"type": "ping"}).to_utf8()))
