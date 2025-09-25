extends Resource
class_name HexData

@export var node_size: float = 1.0
@export var orientation: HexOrientation

var _node_width: float
var _node_height: float

var base_error_msg: String = "This class is meant to be treated as abstract."

enum HexOrientation {
	FLAT,
	POINTY
}

func _init(orientation_prime: HexOrientation):
	orientation = orientation_prime

func get_horz_spacing() -> float:
	Global.logerr("get_horz_spacing", base_error_msg)
	return 0.0

func get_vert_spacing() -> float:
	Global.logerr("get_vert_spacing", base_error_msg)
	return 0.0

func get_hex_corner(_pos: Vector2, _corner_idx: int) -> Vector2:
	Global.logerr("get_hex_corner", base_error_msg)
	return Vector2()
