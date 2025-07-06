extends Label



func _on_score_system_combo_changed(combo: float) -> void:
	text = "x%d" % combo
