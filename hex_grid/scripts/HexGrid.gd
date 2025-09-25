class_name HexGrid

@export var hex_data: HexData

var grid: Array # Array[Array[Hex]]
var base_error_msg: String = "This class is meant to be treated as abstract."

enum HexDirection {
	NORTH,
	NORTH_WEST,
	WEST,
	SOUTH_WEST,
	SOUTH,
	SOUTH_EAST,
	EAST,
	NORTH_EAST
}

func direction(_dir: HexDirection) -> Vector3:
	Global.logerr("direction", base_error_msg)
	return Vector3()

func add_vector(_hex: Hex, _dist: Vector3) -> Hex:
	Global.logerr("add_vector", base_error_msg)
	return Hex.new(0,0)

func get_neighbor(_hex: Hex, _dir: HexDirection) -> Hex:
	Global.logerr("get_neighbor", base_error_msg)
	return Hex.new(0,0)

func get_diagonal_neighbor(_hex: Hex, _dir: HexDirection) -> Hex:
	Global.logerr("get_diagonal_neighbor", base_error_msg)
	return Hex.new(0,0)

func distance(hex_from: Hex, hex_to: Hex) -> float:
	var from = SharedFuncs.ensure_cube_hex(hex_from)
	var to = SharedFuncs.ensure_cube_hex(hex_to)
	
	# Maximum of the 3 coordinates is the distance
	return max(abs(from.q - to.q), abs(from.r - to.r), abs(from.s - to.s))

# TODO: [RCT-2025.09.20] Do we really need to convert from axial to cube here at all?
func get_direction(hex_source: Hex, hex_other) -> HexDirection:
	var source = SharedFuncs.ensure_cube_hex(hex_source)
	var other = SharedFuncs.ensure_cube_hex(hex_other)
	return max( abs(source.q - other.r), abs(source.r - other.s), abs(source.s - other.q) )


func cube_round(hex: Hex) -> Hex:
	var hex_point: Hex = SharedFuncs.ensure_cube_hex(hex)

	var q: int = round(hex_point.x)
	var r: int = round(hex_point.y)
	var s: int = round(hex_point.z)

	var q_diff: float = abs(q - hex_point.x)
	var r_diff: float = abs(r - hex_point.y)
	var s_diff: float = abs(s - hex_point.z)

	if q_diff > r_diff and q_diff > s_diff:
		q = -r-s
	elif r_diff > s_diff:
		r = -q-s
	else:
		s = -q-r

	return Hex.new(q, r, s)
