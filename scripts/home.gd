extends Control

func _ready() -> void:
	FirebaseManager.get_collections()

func _on_produtos_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/products.tscn")


func _on_mercados_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/markets.tscn")
