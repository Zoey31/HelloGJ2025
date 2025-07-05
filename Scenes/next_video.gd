extends TextureButton

var new_vid = preload("res://Scenes/body_yt.tscn")

func _on_pressed() -> void:
	var new_vid_inst = new_vid.instantiate()
	
	print("NEXT")
