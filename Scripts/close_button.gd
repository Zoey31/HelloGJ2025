extends TextureButton

@onready var window = $"../.."

func _on_pressed() -> void:
	print("CLOSE")
	window.queue_free()
