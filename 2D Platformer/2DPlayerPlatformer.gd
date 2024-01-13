extends CharacterBody2D

@export var speed = 300.0
@export var jumpForce = 400.0
@onready var gravityVector = ProjectSettings.get_setting("physics/2d/default_gravity_vector")
@onready var walk := Vector2.ZERO
@onready var fallDirection := Vector2.ZERO

func _physics_process(delta):
	GravitySystem(delta)
	Walk()
	Jump(delta)
	velocity.x = walk.x*speed*delta
	velocity += fallDirection
	move_and_slide()
func GravitySystem(DELTA:float):
	if !is_on_floor():
		fallDirection += gravityVector * DELTA
	else: fallDirection = -get_floor_normal()
func Walk():
	walk.x = Input.get_action_strength("left") - Input.get_action_strength("right")
	walk.y = Input.get_action_strength("up") - Input.get_action_strength("down")
	walk = walk.normalized()
func Jump(DELTA:float):
	if Input.is_action_just_pressed("jump") && is_on_floor():
		fallDirection += jumpForce*DELTA
		await get_tree().create_timer(0.25).timeout
		if Input.is_action_pressed("jump") && !is_on_floor():
			fallDirection += gravityVector * 20 * DELTA
	if Input.is_action_just_released("jump") && !is_on_floor():
		fallDirection += gravityVector * 20 * DELTA
