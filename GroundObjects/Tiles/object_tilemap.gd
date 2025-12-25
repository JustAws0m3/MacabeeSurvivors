extends TileMapLayer

@onready var level_tilemap: TileMapLayer = $"../LevelTilemap"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for cell in get_used_cells():
		var source_id = get_cell_source_id(cell)
		var texture_origin = get_cell_tile_data(cell).texture_origin
		
		#If the object we are looking for exists
		var all_objects = DefinedGroundObjects.new().get_all_dict()
		if source_id in all_objects.keys() and texture_origin in all_objects[source_id].keys():
			
			#Add its object as a child and register it in the level tilemap
			var ground_object = all_objects[source_id][texture_origin]
			print(ground_object)
			var resource = ground_object.resource.instantiate()
			resource.position = map_to_local(cell)
			add_child(resource)
			
			#Register it in the level tilemap
			level_tilemap.set_cell(cell,1,Vector2i(0,0))
