extends TileMap


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func request_move(pawn, direction):
	var cell_start = local_to_map(pawn.position)
	var cell_target = cell_start +  Vector2i(direction)
	
	if cell_start == cell_target:
		return
	
	var cell_target_type = get_cell_tile_data(0, cell_target)
	match cell_target_type.get_custom_data("type"):
		"grass":
			return map_to_local(cell_target)
		
func get_cell_pawn(coordinates):
	for node in get_children():
		if local_to_map(node.position) == coordinates:
			return(node)
