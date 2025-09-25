class_name Hex

# instance data
var q: float # equivalent to x
var r: float # equivalent to y
var s: float # equivalent to z

func _init(q: float, r: float):
	self.q = q
	self.r = r
	self.s = 0

func _init(q: float, r: float, s: float):
	self.q = q
	self.r = r
	self.s = s
