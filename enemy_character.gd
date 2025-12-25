extends CharacterBody2D

@onready var navigation: NavigationAgent2D = $Navigation
@onready var ray_cast: RayCast2D = $RayCast

const SPEED = 250.0

var player: Node2D

var target: Node2D
var locked_on_target = false

func _ready() -> void:
	player = get_tree().current_scene.find_child("Player") as Node2D
	target = player
	navigation.target_position = player.position

func _physics_process(delta: float) -> void:
	# Determine if the enemy should lock on to a target
	ray_cast.target_position = to_local(target.position)
	if ray_cast.get_collider() != null && ray_cast.get_collider() == player:
		rush_target()
		locked_on_target = true
		print("locked",target.name)
	else:
		navigate_to_target()
		locked_on_target = false
		print("unlocked",target.name)
		
func rush_target():
	var direction = to_local(target.position).normalized()
	velocity = direction * SPEED
	move_and_slide()
		
func navigate_to_target():
	if navigation.is_target_reached() or locked_on_target:
		navigation.target_position = target.position

	var direction = to_local(navigation.get_next_path_position()).normalized()
	velocity = direction * SPEED
	move_and_slide()

	
