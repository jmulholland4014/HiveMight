extends HiveMightCharacter
@export var speed = 300
@onready var movement_target: Node2D = get_parent().get_parent().get_node("NavTarget")

@onready var navigation_agent: NavigationAgent2D = get_node("NavigationAgent2D")
func _ready():
	navigation_agent.path_desired_distance = 4.0;
	navigation_agent.target_desired_distance = 4.0;
	call_deferred("actor_setup")
	
func actor_setup():
	await get_tree().physics_frame
	set_movement_target(movement_target.position)
	
func set_movement_target(target_point:Vector2):
	navigation_agent.target_position = target_point
	
func _physics_process(delta):
	if navigation_agent.is_navigation_finished():
		return
	var current_agent_position: Vector2 = global_position
	var next_path_position: Vector2 = navigation_agent.get_next_path_position()
	
	var new_velocity: Vector2 = next_path_position - current_agent_position
	new_velocity = new_velocity.normalized()
	new_velocity = new_velocity * speed
	velocity = new_velocity
	move_and_slide()
