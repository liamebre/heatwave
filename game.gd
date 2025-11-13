extends Node

@export var start_screen : Node
@export var world_scene : PackedScene
var world
func _ready() -> void:
	world = world_scene.instantiate()
	

func _on_start_start() -> void:
	start_screen.hide()
	world = world_scene.instantiate()
	add_child(world)
