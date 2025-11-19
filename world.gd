extends Node
@export var player : Node
var isday = true
var daybar
var temp = 1 

func _ready() -> void:
	daybar = get_node("player/CanvasLayer/UI/daytimer/ProgressBar")

func _process(_delta: float) -> void:
	if daybar.value == daybar.max_value:
		daybar.value = 0
		isday = false
	
func _on_water_body_shape_entered(_body_rid: RID, _body: Node2D, _body_shape_index: int, _local_shape_index: int) -> void:
	if _body.is_in_group("player"):
		temp = 0
		print("splash")

func _on_water_body_shape_exited(_body_rid: RID, _body: Node2D, _body_shape_index: int, _local_shape_index: int) -> void:
	temp = 1
	print("unsplash")

func _on_daytimer_timeout() -> void:
	daybar.value +=1
	if isday and int(daybar.value)%4 == 3:
		player.raise_temp(temp)
	
func _on_item_pickup() -> void:
	player.lower_temp(5)
