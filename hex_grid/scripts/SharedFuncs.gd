class_name SharedFuncs

static func is_hex_cube(hex: Hex) -> bool:
	return (hex.q + hex.r + hex.s) == 0

static func is_hex_axial(hex: Hex) -> bool:
	var s = -hex.q-hex.r
	return (hex.q + hex.r + hex.s) == 0

static func cube_to_axial_hex(hex: Hex) -> Hex:
	var q = hex.q
	var r = hex.r
	return Hex.new(q, r)

static func axial_to_cube_hex(hex: Hex) -> Hex:
	var q = hex.q
	var r = hex.r
	var s = -q-r
	return Hex.new(q, r, s)

static func ensure_cube_hex(hex: Hex) -> Hex:
	if SharedFuncs.is_hex_cube(hex):
		return hex
	return SharedFuncs.axial_to_cube_hex(hex)

static func ensure_axial_hex(hex: Hex) -> Hex:
	if SharedFuncs.is_hex_axial(hex):
		return hex
	return SharedFuncs.cube_to_axial_hex(hex)
