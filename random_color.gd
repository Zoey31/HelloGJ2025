extends TextureRect

func _ready() -> void:
	var r = randf_range(0, 1)
	var g = randf_range(0, 1)
	var b = randf_range(0, 1)
	var random_Color = Color(
		r,g,b 
		)
	self_modulate = random_Color
