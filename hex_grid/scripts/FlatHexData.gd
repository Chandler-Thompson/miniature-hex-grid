class_name FlatHexData
extends HexData

func _init():
	super._init(HexOrientation.FLAT)

	_node_width = 2 * node_size
	_node_height = sqrt(3) * node_size

func get_horz_spacing() -> float:
	return 0.75 * _node_width

func get_vert_spacing() -> float:
	return _node_height

func get_hex_corner(pos: Vector2, corner_idx: int) -> Vector2:
	var angle_deg = 60 * corner_idx
	var angle_rad = deg_to_rad(angle_deg)
	return Vector2(pos.x + node_size * cos(angle_rad), pos.y + node_size * sin(angle_rad))
