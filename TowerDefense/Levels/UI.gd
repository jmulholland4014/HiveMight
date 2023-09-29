extends CanvasLayer

@export var RANGE_INDICATOR_SIZE = 600
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_tower_preview(tower_type, mouse_position):
	var drag_tower = load("res://Towers/" + tower_type + ".tscn").instantiate()
	drag_tower.modulate = drag_tower.selection_green
	drag_tower.set_name("DragTower")
	
	var range_texture = Sprite2D.new()
	range_texture.position = Vector2(0,0)
	var scaling = float(float(drag_tower.tower_range)/ float(RANGE_INDICATOR_SIZE))
	range_texture.scale = Vector2(scaling,scaling)
	var texture = load("res://TowerDefense/Assets/range_overlay.png")
	range_texture.texture = texture
	range_texture.modulate = drag_tower.selection_green
	range_texture.name = "Sprite2D"
	
	var control = Control.new()
	control.add_child(drag_tower)
	control.add_child(range_texture)
	control.position = mouse_position
	control.set_name("TowerPreview")
	add_child(control, true)
	move_child(get_node("TowerPreview"), 0)
	

func update_tower_preview(m_position, is_valid):
	var TE = get_node("TowerPreview")
	var DT = TE.get_node("DragTower")
	var RT = TE.get_node("Sprite2D")
	
	get_node("TowerPreview").position = m_position
	if is_valid:
		DT.modulate = DT.selection_green
		RT.modulate = DT.selection_green
	else:
		DT.modulate = DT.selection_red
		RT.modulate = DT.selection_red
