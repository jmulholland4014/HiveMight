extends Node2D
@onready var levels = get_node("Levels")
@onready var cam_buttons = get_node("SwitchCameraBtns")
@onready var cameras = get_node("Cameras")
@onready var UI = get_node("UI")
func on_new_day():
	levels.add_level()
# Called when the node enters the scene tree for the first time.
func _ready():
	on_new_day()
	on_new_day()
	on_new_day()
	on_new_day()
	for button in cam_buttons.get_children():
		button.activate_camera.connect(activate_cameras)
	pass # Replace with function body.

func activate_cameras(cam_name):
	var back_button = UI.get_node("BackButton")
	if cam_name != "0":
		for button in cam_buttons.get_children():
			button.disabled = true
			button.visible = false
		back_button.visible = true
		back_button.disabled = false
	else:
		for button in cam_buttons.get_children():
			button.disabled = false
			button.visible = true
		back_button.visible = false
		back_button.disabled = true
			
	for camera in cameras.get_children():
		if camera.name == cam_name:
			camera.enabled = true
		else:
			camera.enabled = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_back_button_pressed():
	activate_cameras("0")
	pass # Replace with function body.
