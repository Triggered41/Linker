extends KinematicBody2D


# Keep them variables till we experiment with differen values
export var SPEED = 500
export var JUMP_FORCE = -1000
export var GRAVITY = 50
export var MAXFALLSPEED = 800
export var SMOOTHING = 0.25

export var clone_time := 5.0

var lose_menu = load("res://Scenes/GUI/lose_menu.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.playing = true
	pass # Replace with function body.


var velocity = Vector2.ZERO
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):

	player_movement()
	move_and_slide(velocity, Vector2.UP)

func player_movement():
	
	if is_on_ceiling():
		velocity.y = 0
	
	
	var movex = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.x = lerp(velocity.x, movex*SPEED, SMOOTHING)
	
	if is_on_floor():
		velocity.y = 0
		if Input.is_action_pressed("ui_select"):
			velocity.y += JUMP_FORCE
	else:
		velocity.y += GRAVITY
	velocity.y = clamp(velocity.y, JUMP_FORCE, MAXFALLSPEED)

func kill():
	if !CloneData.can_clone:
		var real_player = get_tree().root.find_node("Player", true, false)
		get_node("Camera2D").global_position = lerp(get_node("Camera2D").global_position, 
														   real_player.get_node("Camera2D").global_position, 1)
		yield(get_tree().create_timer(1), "timeout")
		real_player.set_physics_process(true)
		queue_free()
		CloneData.can_clone = true
	else:
		print("DEAD!")
#		var canvas = CanvasLayer.new()
#		var lose = lose_menu.instance()
#		get_tree().root.add_child(canvas)
#		canvas.add_child(lose)

