class_name GroundObject extends Node

var resource: Resource
var source: int
var coordinates: Vector2i

func _init(resource: Resource, source: int, coordinates: Vector2i) -> void:
	self.resource = resource
	self.source = source
	self.coordinates = coordinates
	
