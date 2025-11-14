extends CharacterBody2D
@export var speed = 200
var screen_size
var sunproc = 1
var tempbar
signal dead

func _ready():
	screen_size = get_viewport_rect().size
	tempbar = $CanvasLayer/UI/thermometer/VSlider
	tempbar.value = 47

func _process(_delta: float) -> void:
	get_input()
	move_and_collide(velocity * _delta)
	if tempbar.value >= tempbar.max_value:
		dead.emit()
	
func get_input():
	var input_dir = Input.get_vector("move_left","move_right","move_up","move_down")
	velocity = input_dir * speed

func raise_temp(x):
	tempbar.value += x/sunproc
