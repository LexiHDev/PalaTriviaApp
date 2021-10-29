extends Node

const PORT: int = 80
const URL: String = "ws://localhost/:%s" % PORT

var client: WebSocketClient

func _ready() -> void:
	client = WebSocketClient.new()
	var err := client.connect("data_received", self, "_on_received_data")
	if err != OK:
		printerr(err)
	err = client.connect("connection_established", self, "_on_connected")
	if err != OK:
		printerr(err)
	client.connect_to_url(URL)
	
func _on_connected(_protocol: String) -> void:
	print("Connected, sending:")
	print("--------------------")
	var message = {
		"cmd": "register",
		"user": User.user.user_name
	}
	print(JSON.print(message))
	# // Here we'll convert the message object to a PoolByteArray, by generating 
		# // a string from the object and then using the String method 'to_utf8()'
	var packet: PoolByteArray = JSON.print(message).to_utf8()
	# // .get_peer(1) is called to get the connected server peer.
	client.get_peer(1).put_packet(packet)

func _on_received_data() -> void:
	var packet: PoolByteArray = client.get_peer(1).get_packet()
	var temp = packet.get_string_from_utf8()
	var parsed_data: Dictionary = JSON.parse(packet.get_string_from_utf8()).result
	print(parsed_data)
	if parsed_data.cmd == "trivia_question":
		Game._set_question(parsed_data)
	if parsed_data.has('users'):
		Game.update_users(parsed_data.users)
func _process(_delta: float) -> void:
	client.poll()

func sendMsg(data) -> void:
	client.get_peer(1).put_packet(JSON.print(data).to_utf8())
