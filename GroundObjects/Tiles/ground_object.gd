class_name GroundObject extends Node

var resource: Resource
var source: int
var coordinates: Vector2i
var solid: bool

func _init(resource: Resource, source: int, coordinates: Vector2i, solid: bool) -> void:
	self.resource = resource
	self.source = source
	self.coordinates = coordinates
	self.solid = solid
	
