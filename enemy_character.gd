extends CharacterBody2D

@onready var navigation: NavigationAgent2D = $Navigation
@onready var ray_cast: RayCast2D = $RayCast

const SPEED = 250.0
const TIME_TO_AQUIRE_TARGET = 3

var target: Node2D
var locked_on_target = false

var delta_sinse_last_reaquisition = 0.0

func _ready() -> void:
	aquire_target()

func _physics_process(delta: float) -> void:
	# Determine if it's time to reconsider what the enemy is targeting
	delta_sinse_last_reaquisition += delta
	if delta_sinse_last_reaquisition > TIME_TO_AQUIRE_TARGET:
		aquire_target()
		delta_sinse_last_reaquisition = 0.0
	
	
	# Determine if the enemy should lock on to a target
	ray_cast.target_position = to_local(target.position)
	if ray_cast.get_collider() != null && ray_cast.get_collider() == target:
		rush_target()
		locked_on_target = true
	else:
		navigate_to_target()
		locked_on_target = false

# Tells the agent to reconsider what it's targeting
func aquire_target():
	var player = get_tree().current_scene.find_child("Player") as Node2D
	var menorah = get_tree().current_scene.find_child("ObjectTilemap").find_child("Menorah",false,false) as Node2D
	print(menorah)
	if menorah == null or position.distance_to(menorah.position) > position.distance_to(player.position):
		if target != player:
			navigation.target_position = player.position
		target = player
	else:
		if target != menorah:
			navigation.target_position = menorah.position
		target = menorah
		

# Tells the agent to move directly towards a target
func rush_target():
	var direction = to_local(target.position).normalized()
	velocity = direction * SPEED
	move_and_slide()

# Tells the agent to move pathfind towards a target
func navigate_to_target():
	if navigation.is_target_reached() or locked_on_target:
		navigation.target_position = target.position

	var direction = to_local(navigation.get_next_path_position()).normalized()
	velocity = direction * SPEED
	move_and_slide()

	
