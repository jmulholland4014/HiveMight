extends Node2D

var map_node
var build_mode = false
var build_valid = false
var build_location 
var build_type
# Called when the node enters the scene tree for the first time.
func _ready():
	map_node = get_node("CanvasLayer")
	for i in get_tree().get_nodes_in_group("build_buttons"):
		i.connect("pressed", Callable(self, "initiate_build_mode").bind(i.name))
		
func _process(delta):
	if build_mode:
		update_tower_preview()
		
func initiate_build_mode(tower_type):
	build_type = tower_type
	build_mode = true
	get_node("UI").set_tower_preview(build_type, get_global_mouse_position())
	pass

func update_tower_preview():
	var mouse_position = get_global_mouse_position()
	var TE = map_node.get_node("TowerExclusion")
	var current_tile = TE.local_to_map(mouse_position)
	var tile_position = TE.map_to_local(current_tile)
	if TE.get_cell_source_id(0,current_tile) == -1:
		get_node("UI").update_tower_preview(tile_position, true)
		build_valid = true
		build_location = tile_position
	else:
		get_node("UI").update_tower_preview(tile_position, false)
		build_valid = false
		
func cancel_build_mode():
	build_mode = false
	build_valid = false
	get_node("UI/TowerPreview").queue_free()

func verify_and_build():
	if build_valid:
		var new_tower = load("res://Towers/" + build_type + ".tscn").instantiate()
		new_tower.state = "Searching"
		new_tower.position = build_location
		map_node.get_node("Towers").add_child(new_tower)
		
func _unhandled_input(event):
	if event.is_action_released("right_click") and build_mode == true:
		cancel_build_mode()
	if event.is_action_released("left_click") and build_mode == true:
		verify_and_build()
		cancel_build_mode()
		pass
