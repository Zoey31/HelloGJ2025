extends TextureRect

func _ready() -> void:
	var r = randf_range(0, 1)
	var g = randf_range(0, 1)
	var b = randf_range(0, 1)
	print(r,g,b)
	var random_Color = Color(
		r,g,b 
		)
	print(random_Color)
	self_modulate = random_Color
