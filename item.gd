extends Node2D
signal pickup
@onready var player: CharacterBody2D = $"../player"


func _on_area_2d_body_shape_entered(_body_rid: RID, _body: Node2D, _body_shape_index: int, _local_shape_index: int) -> void:
	emit_signal("pickup")
	queue_free()

func setpos(x) -> void:
	position = x

func _on_pickup() -> void:
	player.lower_temp(5)
