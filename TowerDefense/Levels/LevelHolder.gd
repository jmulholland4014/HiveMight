extends Node2D
@onready var levels = get_node("Levels")
@onready var cam_buttons = get_node("SwitchCameraBtns")
@onready var cameras = get_node("Cameras")
@onready var UI = get_node("UI")
@onready var spawn_timer = get_node("SpawnTimer")
var wave = 0
var enemies_remaining = 0
var enemies = ["res://Characters/Enemies/enemy_1.tscn"]
# Called when the node enters the scene tree for the first time.
func _ready():
	begin_wave()
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

func begin_wave():
	wave +=1
	enemies_remaining = wave*10
	spawn_timer.start()
		
func spawn_enemy():
	var enemy = load(enemies[randi() % len(enemies)]).instantiate()
	var level = levels.get_children()[randi() % len(levels.get_children())]
	level.add_enemy(enemy)
	enemies_remaining -= 1
	if enemies_remaining <= 0:
		spawn_timer.stop()
	
func _on_back_button_pressed():
	activate_cameras("0")
	pass # Replace with function body.


func _on_spawn_timer_timeout():
	spawn_enemy()
	pass # Replace with function body.
