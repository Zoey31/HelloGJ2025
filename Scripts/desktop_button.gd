extends TextureButton

var window = preload("res://Scenes/window_yt.tscn")

func _on_pressed() -> void:
	print("KLIK")
	var desktop = get_node("../../..")
	desktop.add_child(window.instantiate())
