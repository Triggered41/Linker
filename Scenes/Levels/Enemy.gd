extends KinematicBody2D

var velocity = Vector2()

export var direction = -1

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.playing = true
	if direction == -1:
		$AnimatedSprite.flip_h = true # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	if is_on_wall():
		direction = -direction
		$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
	
	velocity.x = 50 * direction

	move_and_slide(velocity)
