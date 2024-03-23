extends Control



var is_paused = false


func _input(event):
	if event.is_action_pressed("pause"):
		toggle_pause()


func toggle_pause():
	is_paused = !is_paused
	if is_paused:
		show()
		get_tree().paused = true
	else:
		get_tree().paused = false
		hide()





func _on_quit_pressed():
	get_tree().quit()


func _on_resume_pressed():
	toggle_pause()


func _on_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

