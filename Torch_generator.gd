extends Node

var torch = preload("res://TorcheMurale.tscn")
@onready var tile_map: TileMapLayer = $TileMap

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func generate_torchs() -> void:
	var used_case = tile_map.get_used_cells()
	
	for pos_case in used_case:
		var id_tuile = tile_map.get_cell_source_id(pos_case)
		if id_tuile == 1:
			 pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
