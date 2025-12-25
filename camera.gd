extends Camera2D

const STATIC_CAMERA_RADIUS = 1000

@onready var character: CharacterBody2D = $"../Character"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var position_delta = position.distance_to(character.position)
	if position_delta > STATIC_CAMERA_RADIUS:
		position -= (position - character.position) * pow(position_delta - STATIC_CAMERA_RADIUS,1.25) * 0.00001
