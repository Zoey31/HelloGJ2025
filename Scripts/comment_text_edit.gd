extends TextEdit

signal text_sent(text: String)

func _on_send_button_pressed() -> void:
	text_sent.emit(text)
