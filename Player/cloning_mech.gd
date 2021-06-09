extends Node


onready var player = get_parent()


func _physics_process(delta):
	if Input.is_action_just_released("Action"):
		clone()
		
func clone():
	if CloneData.can_clone and CloneData.clone_power > 0:
		player.set_physics_process(false)
		var clone = player.duplicate()
		clone.name = "clone"
		get_tree().root.add_child(clone)
		CloneData.clone_power -= 1
		clone.global_position = player.global_position
		CloneData.can_clone = false

	else:
		if player.name == "clone":
			var real_player = get_tree().root.find_node("Player", true, false)
			player.get_node("Camera2D").global_position = lerp(player.get_node("Camera2D").global_position, 
															   real_player.get_node("Camera2D").global_position, 1)
			yield(get_tree().create_timer(1), "timeout")
			real_player.set_physics_process(true)
			player.queue_free()
			CloneData.can_clone = true
			
