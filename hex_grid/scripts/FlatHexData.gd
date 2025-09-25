class_name FlatHexGridData
extends HexGridData

func _init():
	super._init(HexGridOrientation.FLAT)

	node_width = 2 * node_size
	node_height = sqrt(3) * node_size

func get_horz_spacing() -> double:
	return 0.75 * node_width

func get_vert_spacing() -> double:
	return node_height

func get_hex_corner(pos: Vector2, corner_idx: int) -> Vector2:
	var angle_deg = 60 * corner_idX
	var angle_rad = deg_to_rad(angle_deg)
	return Vector2(pos.x + node_size * cos(angle_rad), pos.y + node_size * sin(angle_rad))
