extends CharacterBody2D

@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D

const SPEED = 500.0

var player: Node2D
var player_character: CharacterBody2D

func _ready() -> void:
	player = get_tree().current_scene.find_child("Player") as Node2D
	player_character = player.find_child("Character") as CharacterBody2D
	navigation_agent_2d.target_position = player_character.position

func _physics_process(delta: float) -> void:
	if navigation_agent_2d.is_target_reached():
		navigation_agent_2d.target_position = player_character.position
	else:
		var nav_point_direction = to_local(navigation_agent_2d.get_next_path_position())
	
