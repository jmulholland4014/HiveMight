extends HiveMightCharacter


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var sword = get_node("Sword")
@onready var sword_animation_player = sword.get_node("SwordAnimationPlayer")

func _physics_process(delta):
	var mouse_direction = (get_global_mouse_position() - global_position).normalized()
	if (sword.scale.y > 0 and mouse_direction.x < 0) or (sword.scale.y < 0 and mouse_direction.x > 0):
		sword.scale.y *= -1
	if Input.is_action_just_pressed("left_click") and not sword_animation_player.is_playing():
		sword_animation_player.play("attack")
	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var EW_direction = Input.get_axis("ui_left", "ui_right")
	if EW_direction:
		velocity.x = EW_direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	var NS_direction = Input.get_axis("ui_up", "ui_down")
	if NS_direction:
		velocity.y = NS_direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	sword.rotation = mouse_direction.angle()

	move_and_slide()


func _on_hit_box_body_entered(body):
	body.take_damage(20)
	pass # Replace with function body.
