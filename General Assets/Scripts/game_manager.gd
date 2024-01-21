extends Node

#@export var pauseUIRef : NodePath
#@onready var pauseUI = get_node(pauseUIRef)

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
func _physics_process(delta):
	if Input.is_action_just_pressed("exit"):
		get_tree().quit()
#		Pause_Unpause()
func Pause_Unpause():
	get_tree().paused = !get_tree().paused
