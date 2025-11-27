extends Control
signal start

func _on_start_button_down() -> void:
	start.emit()

func _on_menu_button_down() -> void:
	pass # Replace with function body.
