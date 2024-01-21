extends SpringArm3D

@export var displace_Height:float
@export var lerpSpeed:float
@export var minLength:float
@export var maxLength:float
@export var pitch := Vector2(-80.0,80.0)
@export var yaw := Vector2(0.0,360.0)
@onready var camInputs := Vector2.ZERO
@onready var parent := $".."

func _ready():
	set_as_top_level(true)
func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotation.x -= event.relative.y*parent.mouseSpeed*get_physics_process_delta_time()
		rotation.x = clamp(rotation.x,deg_to_rad(pitch.x),deg_to_rad(pitch.y))
		rotation.y -= event.relative.x*parent.mouseSpeed*get_physics_process_delta_time()
		rotation.y = wrapf(rotation.y,deg_to_rad(yaw.x),deg_to_rad(yaw.y))
func _physics_process(delta: float) -> void:
	position = lerp(position,(parent.global_position+Vector3(0,displace_Height,0)),lerpSpeed*delta)
	Controller_Inputs()
	Ctrlr_Pitch_Yaw(delta)
func Controller_Inputs():
	camInputs = Input.get_vector("camLeft","camRight","camUp","camDown").normalized()
func Ctrlr_Pitch_Yaw(DELTA:float):
	rotation.x -= camInputs.y*parent.controllerSpeed*DELTA
	rotation.x = clamp(rotation.x,deg_to_rad(pitch.x),deg_to_rad(pitch.y))
	rotation.y += camInputs.x*parent.controllerSpeed*DELTA
	rotation.y = wrapf(rotation.y,deg_to_rad(yaw.x),deg_to_rad(yaw.y))
