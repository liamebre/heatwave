extends CharacterBody2D
@export var speed = 200
var screen_size

func _ready():
	screen_size = get_viewport_rect().size
	
func _process(_delta: float) -> void:
	get_input()
	move_and_collide(velocity * _delta)
	
func get_input():
	var input_dir = Input.get_vector("move_left","move_right","move_up","move_down")
	velocity = input_dir * speed
