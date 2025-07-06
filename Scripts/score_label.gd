extends Label


func _on_score_changed(score: float) -> void:
	text = "%d" % score
