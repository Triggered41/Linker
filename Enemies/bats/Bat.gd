extends KinematicBody2D

export var speed = 10.10
export var scout_distance = 500

var velocity = Vector2.ZERO

var scout_area
var move_dir = 1

var base_pos

var attacking = false
var target


func _ready():
	base_pos = global_position.x
	scout_area = global_position.x + scout_distance

func _physics_process(delta):

	if attacking:
		sinew(0.01)
	else:
		movement()
		modulate = Color.white

	velocity = move_and_slide(velocity)

func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		target = body
		attacking = true
		velocity.x = 0
		look(body.global_position)
		$shoot/attack_timer.start()
		
func _on_Area2D_body_exited(body):
	if body.is_in_group("player"):
		movement()
		attacking = false

func movement():
	if global_position.x > scout_area:
		move_dir = -1
	elif global_position.x < base_pos:
		move_dir = 1
		
	$Bat_sprite.scale.x = move_dir
	velocity.x = speed * move_dir
	
func look(pos):
	if pos.x < global_position.x:
		$Bat_sprite.scale.x = -1
	elif pos.x > global_position.x:
		$Bat_sprite.scale.x = 1

func sinew(t):
	var w = (sin(OS.get_ticks_msec() * t)+1)
	modulate = Color(1+w, 1+w, 1+w, 1)
