class_name AxialHexGrid
extends HexGrid

var axial_direction_vectors: Array[Vector3] = [
	Vector3(1, 0, 0), Vector3(1, -1, 0), Vector3(0, -1, 0),
	Vector3(-1, 0, 0), Vector3(-1, 1, 0), Vector3(0, 1, 0)
]

var axial_diagonal_vectors: Array[Vector3] = [
	Vector3(2, -1, 0), Vector3(1, -2, 0), Vector3(-1, -1, 0),
	Vector3(-2, 1, 0), Vector3(-1, 2, 0), Vector3(1, 1, 0)
]

func direction(dir: HexDirection) -> Vector3:
	return axial_direction_vectors[dir]

func add_vector(hex: Hex, dist: Vector3) -> Hex:
	return Hex.new(hex.q + dist.x, hex.r + dist.y)

func get_neighbor(hex: Hex, dir: HexDirection) -> Hex:
	return add_vector(hex, axial_direction_vectors[dir])

func get_diagonal_neighbor(hex: Hex, dir: HexDirection) -> Hex:
	return add_vector(hex, axial_diagonal_vectors[dir])
