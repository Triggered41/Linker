extends Camera2D



func _ready():
	yield(get_tree().create_timer(0.02),"timeout")
	set_bounds()

func set_bounds():
	limit_left = Bounds.left
	limit_right = Bounds.right
	limit_top = Bounds.top
	limit_bottom = Bounds.bottom
