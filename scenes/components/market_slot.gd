extends PanelContainer
@onready var market_name_label: Label = $MarginContainer/VBoxContainer/MarketNameLabel
@onready var last_change_label: Label = $MarginContainer/VBoxContainer/LastChangeLabel


func setup(market_name : String, last_change : String):
	market_name_label.text = market_name
	last_change_label.text = "Última Mudança: %s" % last_change


func _on_button_pressed() -> void:
	pass # Replace with function body.
