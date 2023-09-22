extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_tower_preview(tower_type, mouse_position):
	var drag_tower = load("res://Towers/" + tower_type + ".tscn").instantiate()
	drag_tower.modulate = drag_tower.selection_green
	drag_tower.set_name("DragTower")
	var control = Control.new()
	control.add_child(drag_tower)
	control.position = mouse_position
	control.set_name("TowerPreview")
	add_child(control, true)
	move_child(get_node("TowerPreview"), 0)

func update_tower_preview(m_position, is_valid):
	var TE = get_node("TowerPreview")
	var DT = TE.get_node("DragTower")
	
	get_node("TowerPreview").position = m_position
	if is_valid:
		DT.modulate = DT.selection_green
	else:
		DT.modulate = DT.selection_red
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
