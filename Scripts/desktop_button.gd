extends TextureButton

var window = preload("res://Scenes/window_yt.tscn")
@onready var score_system = $"../../../../ScoreSystem"
@onready var taskbar = $"../../../Taskbar"

func _on_pressed() -> void:
	print("KLIK")
	var desktop = get_node("../../..")
	var win_inst = window.instantiate()
	win_inst.comment_added.connect(score_system._on_comment_added)
	desktop.add_child(win_inst)
	desktop.move_child(taskbar,desktop.get_child_count() - 1)
