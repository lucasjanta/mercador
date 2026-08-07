extends Control
@onready var markets_container: VBoxContainer = $PanelContainer/MarginContainer/VBoxContainer/ScrollContainer/MarketsContainer
@onready var add_market_container: PanelContainer = $PanelContainer/MarginContainer/AddMarketContainer

@onready var market_name_input: LineEdit = $PanelContainer/MarginContainer/AddMarketContainer/MarginContainer/VBoxContainer/VBoxContainer/MarketNameInput
@onready var lat_input: LineEdit = $PanelContainer/MarginContainer/AddMarketContainer/MarginContainer/VBoxContainer/VBoxContainer2/HBoxContainer/LatInput
@onready var lon_input: LineEdit = $PanelContainer/MarginContainer/AddMarketContainer/MarginContainer/VBoxContainer/VBoxContainer2/HBoxContainer/LonInput

var collection: FirestoreCollection = Firebase.Firestore.collection("markets")

var new_market_data : Dictionary = {}

func populate_markets():
	for child in markets_container.get_children():
		child.queue_free()
	
	#adicionar logica pra popular mercados



func _on_add_market_button_pressed() -> void:
	print(collection)
	reset_inputs()
	add_market_container.visible = true
	
	

func reset_inputs():
	market_name_input.text = ""
	lat_input.text = ""
	lon_input.text = ""


func _on_cancel_button_pressed() -> void:
	add_market_container.visible = false


func _on_save_button_pressed() -> void:
	pass # Replace with function body.
