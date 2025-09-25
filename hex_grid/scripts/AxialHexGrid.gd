class_name AxialHexGrid
extends HexGrid

var axial_direction_vectors: Array[Vector2] = [
	Vector2(1, 0), Vector2(1, -1), Vector2(0, -1),
	Vector2(-1, 0), Vector2(-1, 1), Vector2(0, 1)
]

var axial_diagonal_vectors: Array[Vector2] = [
	Vector2(2, -1), Vector2(1, -2), Vector2(-1, -1),
	Vector2(-2, 1), Vector2(-1, 2), Vector2(1, 1)
]

func direction(dir: HexDirection) -> Vector2:
	return axial_direction_vectors[dir]

func add_vector(hex: Hex, dist: Vector2) -> Hex:
	return Hex(hex.q + dist.x, hex.r + dist.y)

func get_neighbor(hex: Hex, dir: HexDirection) -> Hex:
	return add_vector(hex, axial_direction_vectors[dir])

func get_diagonal_neighbor(hex: Hex, dir: HexDirection) -> Hex:
	return add_vector(hex, axial_diagonal_vectors[dir])
