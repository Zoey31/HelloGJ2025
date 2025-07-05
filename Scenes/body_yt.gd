extends VBoxContainer
var video = preload("res://Scenes/image.tscn")

func _ready() -> void:
	add_child(video.instantiate())
