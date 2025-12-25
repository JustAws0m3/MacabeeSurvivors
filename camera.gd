extends Camera2D

const STATIC_CAMERA_RADIUS = 300
const SMOOTHING_FACTOR  = 0.0000075

var last_global_position = Vector2.ZERO

func _process(delta: float) -> void:
	global_position = last_global_position
	
	var position_delta = global_position.distance_to(get_parent().position)
	if position_delta > STATIC_CAMERA_RADIUS:
		position -= (global_position - get_parent().position) * pow(position_delta - STATIC_CAMERA_RADIUS,1.25) * SMOOTHING_FACTOR
		
	last_global_position = global_position
