extends Node
@export var player : Node
@export var water : PackedScene
@export var sticks : PackedScene
var isday = true
var daybar
var temp = 1 

func _ready() -> void:
	daybar = get_node("player/CanvasLayer/UI/daytimer/ProgressBar")
	var drop = water.instantiate()
	drop.setpos(Vector2(100,100))
	add_child(drop)
	
	var stick = sticks.instantiate()
	drop.setpos(Vector2(100,100))
	add_child(stick)

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
	
	if isday and int(daybar.value)%15 == 14:
		var drop = water.instantiate()
		var pos = Vector2(randf_range(0,1000),randf_range(0,600))
		drop.setpos(pos)
		add_child(drop)
		
		var stick = water.instantiate()
		stick.setpos(Vector2(randf_range(0,1000) , randf_range(0,600)))
		add_child(stick)
	
