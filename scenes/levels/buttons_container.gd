extends HBoxContainer


@onready var save_button = $SaveButton
@onready var load_button = $LoadButton


func _on_save_button_button_down():
	get_viewport().gui_release_focus()


func _on_load_button_button_down():
	get_viewport().gui_release_focus()
