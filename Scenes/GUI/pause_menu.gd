extends Control


export(PackedScene) var main_menu: PackedScene

func _on_resume_button_up():
	get_parent().queue_free()
	get_tree().paused = false
	queue_free()


func _on_retry_button_up():
	get_parent().queue_free()
	get_tree().paused = false
	get_tree().reload_current_scene()


func _on_main_menu_button_up():
	get_parent().queue_free()
	get_tree().paused = false
	get_tree().change_scene_to(main_menu)
