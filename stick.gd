extends Node2D
@onready var player: CharacterBody2D = $"../player"


func _on_area_2d_body_shape_entered(_body_rid: RID, _body: Node2D, _body_shape_index: int, _local_shape_index: int) -> void:
	on_pickup()
	queue_free()

func setpos(x) -> void:
	position = x

func on_pickup():
	player.numstick += 1
	print("sitck")
