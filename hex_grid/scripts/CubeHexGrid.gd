class_name CubeHexGrid
extends HexGrid

var cube_direction_vectors: Array[Vector3] = [
	Vector3(1, 0, -1), Vector3(1, -1, 0), Vector3(0, -1, 1),
	Vector3(-1, 0, 1), Vector3(-1, 1, 0), Vector3(0, 1, -1)
]

var cube_diagonal_vectors: Array[Vector3] = [
	Vector3(2, -1, -1), Vector3(1, -2, 1), Vector3(-1, -1, 2),
	Vector3(-2, 1, 1), Vector3(-1, 2, -1), Vector3(1, 1, -2)
]

func direction(dir: HexDirection) -> Vector3:
	return cube_direction_vectors[dir]

func add_vector(hex: Vector3, dist: Vector3) -> Vector3:
	return Vector3(hex.q + dist.x, hex.r + dist.y, hex.s + dist.z)

func get_neighbor(hex: Hex, dir: HexDirection) -> Hex:
	return add_vector(hex, cube_direction_vectors[dir])

func get_diagonal_neighbor(hex: Hex, dir: HexDirection) -> Hex:
	return add_vector(hex, cube_diagonal_vectors[dir])

func distance(hex_from: Hex, hex_to: Hex) -> float:
	var from: Hex = hex_from
	if SharedFuncs.is_hex_axial(hex_from):
		from = SharedFuncs.axial_to_cube(hex_from)

	var to: Hex = hex_to
	if SharedFuncs.is_hex_axial(hex_to):
		to = SharedFuncs.axial_to_cube(hex_to)

	return max(abs(from.q - to.q), abs(from.r - to.r), abs(from.s - to.s))
