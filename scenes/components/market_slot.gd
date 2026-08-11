extends PanelContainer
@onready var market_name_label: Label = $MarginContainer/VBoxContainer/MarketNameLabel
var market_id : String


func setup(id: String, market_name : String):
	market_id = id
	market_name_label.text = market_name


func _on_button_pressed() -> void:
	pass # Replace with function body.
