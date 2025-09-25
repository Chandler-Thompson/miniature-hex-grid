extends Resource
class_name HexData

@export var node_size: double = 1.0
@export var orientation: HexOrientation

var orientation: HexOrientation

var _node_width: double
var _node_height: double

var base_error_msg: String = "This class is meant to be treated as abstract."

enum HexOrientation {
	FLAT,
	POINTY
}

func _init(orientation: HexOrientation):
	self.orientation = orientation

func get_horz_spacing() -> double:
	Global.logerr("get_horz_spacing", base_error_msg)
	get_tree().quit()

func get_vert_spacing() -> double:
	Global.logerr("get_vert_spacing", base_error_msg)
	get_tree().quit()

func get_hex_corner(pos: Vector2, corner_idx: int) -> Vector2:
	Global.logerr("get_hex_corner", base_error_msg)
	get_tree().quit()
