extends TileMapLayer

const MENORAH = preload("uid://ctlaroyu8g3q1")



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for cell in get_used_cells():
		var source_id = get_cell_source_id(cell)
		var texture_origin = get_cell_tile_data(cell).texture_origin
		
		for ground_object in DefinedGroundObjects.new().get_all():
			print(ground_object)
			if ground_object.source == source_id && ground_object.coordinates == texture_origin:
				print(ground_object)
				var resource = ground_object.resource.instantiate()
				resource.position = map_to_local(cell)
				add_child(resource)
