extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for i in range (0,len(get_children())):
		if i >= TDGlobalData.hearts:
			get_children()[i].queue_free()
			
