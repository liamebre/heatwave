extends CharacterBody2D
@export var speed = 200
var screen_size
var sunproc = 1
var tempbar
var healthbar
var tempdamage = 2 

func _ready():
	screen_size = get_viewport_rect().size
	tempbar = $CanvasLayer/UI/thermometer/VSlider
	tempbar.value = 20
	healthbar = $CanvasLayer/UI/health/ProgressBar

func _process(_delta: float) -> void:
	get_input()
	move_and_collide(velocity * _delta)
	if tempbar.value >= tempbar.max_value:
		get_tree().quit()
	
func get_input():
	var input_dir = Input.get_vector("move_left","move_right","move_up","move_down")
	velocity = input_dir * speed

func raise_temp(x):
	tempbar.value += x/sunproc
	if tempbar.value >= 30:
		takedamage(tempdamage)
		
func lower_temp(x):
	tempbar.value -= x
	if tempbar.value <= -10:
		takedamage(tempdamage)
	
func takedamage(x):
	if healthbar.value-x <= 0:
		get_tree().quit()
	else:
		healthbar.value -= x
