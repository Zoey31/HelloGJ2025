extends Label


func _on_score_changed(score: float) -> void:
	text = "Score: %d" % score
