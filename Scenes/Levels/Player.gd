extends KinematicBody2D


# Keep them variables till we experiment with differen values
export var SPEED = 500
export var JUMP_FORCE = -1000
export var GRAVITY = 50
export var MAXFALLSPEED = 800
export var SMOOTHING = 0.25

var lose_menu = load("res://Scenes/GUI/lose_menu.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.playing = true
	pass # Replace with function body.


var velocity = Vector2.ZERO
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):

	if is_dead():
		get_tree().change_scene_to(lose_menu)

	player_movement()
	move_and_slide(velocity, Vector2.UP)

func player_movement():
	var movex = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.x = lerp(velocity.x, movex*SPEED, SMOOTHING)
	
	if is_on_floor():
		velocity.y = 0
		if Input.is_action_pressed("ui_select"):
			velocity.y += JUMP_FORCE
	else:
		velocity.y += GRAVITY
	velocity.y = clamp(velocity.y, JUMP_FORCE, MAXFALLSPEED)

func is_dead():
	for i in get_slide_count():
		if get_slide_collision(i).collider.name == "Spikes_tileMap":
			return true
		else: 
			return false
	
	
