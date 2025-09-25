class_name SharedFuncs

func is_hex_cube(hex: Hex) -> Hex:
	return (hex.q + hex.r + hex.s) == 0

func is_hex_axial(hex: Hex) -> Hex:
	var s = -hex.q-hex.r
	return (hex.q + hex.r + hex.s) == 0

func cube_to_axial_hex(hex: Hex) -> Hex:
	var q = hex.q
	var r = hex.r
	return Hex(q, r)

func axial_to_cube_hex(hex: Hex) -> Hex:
	var q = hex.q
	var r = hex.r
	var s = -q-r
	return Hex(q, r, s)

func ensure_cube_hex(hex: Hex) -> Hex:
	if SharedFuncs.is_hex_cube(hex):
		return hex
	return SharedFuncs.axial_to_cube_hex(hex)

func ensure_axial_hex(hex: Hex) -> Hex:
	if SharedFuncs.is_hex_axial(hex):
		return hex
	return SharedFuncs.cube_to_axial_hex(hex)
