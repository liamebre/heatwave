extends Node

@export var start_screen : Node
@export var world : Node

func _ready() -> void:
	pass

func _on_start_start() -> void:
	start_screen.hide()
	world.show()
	
