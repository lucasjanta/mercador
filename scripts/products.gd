extends Control
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var search_input: LineEdit = $PanelContainer2/MarginContainer/HBoxContainer/SearchInput

var search_on : bool = false
func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/home.tscn")


func _on_search_button_pressed() -> void:
	if !search_on:
		search_on = true
		animation_player.play("search_bar_in")
		search_input.grab_focus()
	else:
		search_on = false
		animation_player.play("search_bar_out")
		search_input.release_focus()
		search_input.clear()
