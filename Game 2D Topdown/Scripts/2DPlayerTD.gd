extends CharacterBody2D

@export var speed = 300.0
@export var jumpForce = 400.0
@onready var gravityVector = ProjectSettings.get_setting("physics/2d/default_gravity_vector")
@onready var walk := Vector2.ZERO
@onready var fallDirection := Vector2.ZERO
@onready var spr := $SprPlayer
@onready var anim := $SprAnimation

func _physics_process(delta):
	Walk()
	velocity = lerp(velocity,walk*speed*delta,10*delta)
	move_and_slide()
func Walk():
	walk = Input.get_vector("left","right","forward","back").normalized()
