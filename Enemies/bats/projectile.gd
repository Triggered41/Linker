extends Area2D

var speed = 10

func _physics_process(delta):
	position += speed * transform.x
	
