extends Control

signal comment_added(text: String)

func _on_comments_layout_user_comment_added(text: String) -> void:
	comment_added.emit(text)
