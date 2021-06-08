extends Control

export(PackedScene) var game_level: PackedScene

func _on_play_button_up():
	get_tree().change_scene_to(game_level)

func _on_Exit_button_up():
	get_tree().quit()
