extends Control

export(PackedScene) var game_level: PackedScene

func _on_play_button_up():
	get_tree().change_scene("res://Scenes/Levels/Level1.tscn")

func _on_Exit_button_up():
	get_tree().quit()
