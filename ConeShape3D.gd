@tool
@icon("uid://cbn5dbyqbi1pu")
class_name ConeShape3D
extends ConvexPolygonShape3D

@export var radius: float = 1.0:
	set(value):
		radius = value
		_regenerate()
@export var height: float = 1.0:
	set(value):
		height = value
		_regenerate()
@export_range(3, 16, 1, "or_greater") var resolution: int = 8:
	set(value):
		resolution = value
		_regenerate()
@export var squish: Vector2 = Vector2.ONE:
	set(value):
		squish = value
		_regenerate()


func _init() -> void:
	_regenerate()


func _regenerate() -> void:
	var res = PackedVector3Array()
	res.resize(resolution + 1) # circle plus tip
	res[resolution] = Vector3.ZERO # tip
	for i: int in range(resolution):
		var fac := i / float(resolution)
		var rad := TAU * fac
		var x := cos(rad) * squish.x * radius
		var z := sin(rad) * squish.y * radius
		res[i] = Vector3(x, -height, z)

	points = res
