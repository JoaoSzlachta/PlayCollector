extends CharacterBody2D


@export var speed = 400

#Get the input commands
func get_input():
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_direction * speed

#Make it moves
func _physics_process(_delta):
	get_input()
	move_and_slide()
