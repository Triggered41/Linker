extends CanvasLayer

var timer:Timer

func _physics_process(delta):
	if get_tree().root.has_node("clone"):
		var player = get_tree().root.get_node("clone")
		$Control/ProgressBar.value = player.get_node("Node2D/clone_tick").time_left
	else:
		$Control/ProgressBar.value = $Control/ProgressBar.max_value
