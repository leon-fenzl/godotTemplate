extends StaticBody3D
class_name MovingPlatform

@export var speed := 25.0
@export var minDistance := 1.0
@export var posArray := PackedVector3Array()

@onready var distance:=Vector3.ZERO
@onready var index:=0
@onready var player:Node = null
func _ready():
	print(posArray.size())
func _physics_process(delta):
	if posArray.size() != TYPE_NIL || posArray.size() != 0:
		CycledBehaviour()
		position = lerp(position,posArray[index],speed*delta)
func CycledBehaviour():
	distance = posArray[index] - position
	if distance.length() < minDistance:
		if index < posArray.size()-1:index+=1
		else:index = 0
