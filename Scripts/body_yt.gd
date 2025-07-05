extends VBoxContainer
var yt = preload("res://Scenes/body_yt.tscn")

func _ready() -> void:
	print(get_parent().name)
	add_child(yt.instantiate())
	
	print(get_parent().name.to_upper())
	for child in get_children():
		print(child.name)
