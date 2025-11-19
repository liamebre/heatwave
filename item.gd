extends Node2D
signal pickup


func _on_area_2d_body_shape_entered(_body_rid: RID, _body: Node2D, _body_shape_index: int, _local_shape_index: int) -> void:
	if _body.is_in_group("player"):
		emit_signal("pickup")
		queue_free()
