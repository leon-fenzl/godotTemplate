extends Camera2D

@export var displace_Height:float
@export var lerpSpeed:float
@onready var parent := $".."

#func _ready():
	#set_as_top_level(true)
#func _physics_process(delta: float) -> void:
	#position = lerp(position,(parent.global_position+Vector2(0,displace_Height)),lerpSpeed*delta)
