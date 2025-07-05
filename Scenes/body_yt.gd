extends VBoxContainer
var video = preload("res://Scenes/image.tscn")

func _ready() -> void:
	print(get_parent().name)
	add_child(video.instantiate())
	add_child(video.instantiate())
	add_child(video.instantiate())
	add_child(video.instantiate())
	add_child(video.instantiate())
	add_child(video.instantiate())
	add_child(video.instantiate())
