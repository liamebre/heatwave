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
	
func _on_daytimer_timeout() -> void:
	daybar.value +=1
	if isday and int(daybar.value)%4 == 3:
		player.raise_temp(temp)
	
