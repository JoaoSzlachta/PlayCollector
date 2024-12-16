extends CharacterBody2D

@onready var animation_tree: AnimationTree = $AnimationTree	
@onready var animation_state = animation_tree.get("parameters/playback")

@export var speed = 400
var input_direction = Vector2.ZERO

#Make it moves
func _physics_process(_delta):
	move()
	
func move():
	input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	if input_direction != Vector2.ZERO:
		animation_tree.set("parameters/Idle/blend_position", input_direction)
		animation_tree.set("parameters/Walk/blend_position", input_direction)
		animation_state.travel("Walk")
		
		velocity = input_direction * speed
	
	if input_direction == Vector2.ZERO:
		animation_state.travel("Idle")
		velocity = Vector2.ZERO
		
	move_and_slide()
