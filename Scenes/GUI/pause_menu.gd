extends Control


export(PackedScene) var main_menu: PackedScene

func _on_resume_button_up():
	queue_free()


func _on_retry_button_up():
	get_tree().reload_current_scene()


func _on_main_menu_button_up():
	get_tree().change_scene_to(main_menu)
