extends CharacterBody2D
class_name Tower
var target = null
var starting_pos = global_position
@export var max_distance = 200
@export var distance_from_target = 10
@export var speed = 50
@onready var animation_player = get_node("AnimationPlayer")
@onready var sprite = get_node("Sprite2D")
#Multiplied by 2 because it chooses a point between -max_distance, max_distance
var tower_range = max_distance * 2
var rng = RandomNumberGenerator.new()
var state = "Searching"
@export var selection_green = "00914f"
@export var selection_red = "e20035"
var moving_animation = "Flying"
func _ready():
	starting_pos = global_position
	get_new_target()
	clarifications()
	randomize()

#Used to clarify any variables due to children being different.
func clarifications():
	pass
	
func _physics_process(delta):
	velocity = Vector2.ZERO
	if state == "Searching" and target != null:
		move_to_target()
	elif state == "Attacking":
		pass
	move_and_slide()	
func get_new_target():
	target = Vector2(starting_pos.x + rng.randi_range(-max_distance, max_distance), starting_pos.y + rng.randi_range(-max_distance, max_distance))
func move_to_target():
	if abs(position.distance_to(target)) < 10:
		get_new_target()
	else:
		velocity = (target - position).normalized() * speed
	move()
	
func move():
		if velocity.x < 0:
			sprite.flip_h = true
		else:
			sprite.flip_h = false
				
		animation_player.play(moving_animation)
