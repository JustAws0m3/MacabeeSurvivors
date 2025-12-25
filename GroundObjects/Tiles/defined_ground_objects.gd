class_name DefinedGroundObjects

var MENORAH

# Called when the node enters the scene tree for the first time.
func _init() -> void:
	MENORAH = GroundObject.new(preload("uid://ctlaroyu8g3q1"),0,Vector2i(0,0),true)

func get_all_dict():
	return {
		0: {
			Vector2i(0,0): MENORAH
		}
	}
