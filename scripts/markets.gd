extends Control
@onready var markets_container: VBoxContainer = $PanelContainer/MarginContainer/VBoxContainer/ScrollContainer/MarketsContainer
@onready var add_market_container: PanelContainer = $PanelContainer/MarginContainer/AddMarketContainer

@onready var market_name_input: LineEdit = $PanelContainer/MarginContainer/AddMarketContainer/MarginContainer/VBoxContainer/VBoxContainer/MarketNameInput
@onready var lat_input: LineEdit = $PanelContainer/MarginContainer/AddMarketContainer/MarginContainer/VBoxContainer/VBoxContainer2/HBoxContainer/LatInput
@onready var lon_input: LineEdit = $PanelContainer/MarginContainer/AddMarketContainer/MarginContainer/VBoxContainer/VBoxContainer2/HBoxContainer/LonInput

const MARKET_SLOT = preload("uid://ddt487dxwjype")


func _ready() -> void:
	populate_markets()

func populate_markets():
	for child in markets_container.get_children():
		child.queue_free()
	
	var documents: Array = await FirebaseManager.get_markets()
	
	for document in documents:
		var new_market_slot = MARKET_SLOT.instantiate()
		markets_container.add_child(new_market_slot)
		var market_name : String = document.get_value("name")
		new_market_slot.setup(document.doc_name, market_name)


func _on_add_market_button_pressed() -> void:
	reset_inputs()
	add_market_container.visible = true
	
	

func reset_inputs():
	market_name_input.text = ""
	lat_input.text = ""
	lon_input.text = ""


func _on_cancel_button_pressed() -> void:
	add_market_container.visible = false


func _on_save_button_pressed() -> void:
	if market_name_input.text.strip_edges().is_empty():
		return
		
	var document  = await FirebaseManager.add_market(market_name_input.text.strip_edges(), lat_input.text.to_float(), lon_input.text.to_float())
	if document:
		print("Mercado criado com sucesso!")
		print("ID: ", document.doc_name)

		add_market_container.visible = false
		reset_inputs()

		await populate_markets()
	else:
		print("Erro ao criar mercado.")

func _on_return_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/home.tscn")
