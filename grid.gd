extends TileMap

class_name  Grid

var Apple = preload("res://apple/Apple.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_apples(5)
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
	var tile_type = cell_target_type.get_custom_data("type")
	if tile_type == "path":
		return map_to_local(cell_target)
		
func get_random_path_tile() -> Vector2:
	var map_size = get_used_rect().size
	var cell_pos = Vector2(randi() % map_size.x, randi() % map_size.y)
	var cell_target_type = get_cell_tile_data(0, cell_pos)
	var tile_type = cell_target_type.get_custom_data("type")
	if tile_type == "path":
		return cell_pos
	else:
		return get_random_path_tile()

func spawn_apples(apples_to_spawn):
	for i in range(apples_to_spawn):
		# Get a random tile with a "type" of "path"
		var tile_pos = get_random_path_tile()
		
		# Create an instance of the Apple scene
		var apple_instance = Apple.instantiate()
		
		# Set the position of the Apple instance to the center of the chosen tile
		apple_instance.position = map_to_local(tile_pos)
#		apple_instance.z_index = -1
		
		# Add the Apple instance to the scene
		add_child(apple_instance) 
	
