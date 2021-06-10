extends CanvasLayer

var player
var timer:Timer

func _ready():
	set_physics_process(false)
	player = get_tree().root.find_node("clone", true, false)
	if player:
		timer = player.get_node("Node2D/clone_tick")
		set_physics_process(true)

func _physics_process(delta):
	$Control/ProgressBar.value = timer.time_left
