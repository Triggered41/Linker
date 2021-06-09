extends Node

onready var left_bound := $left
onready var right_bound := $right
onready var top_bound := $top
onready var bottom_bound := $bottom

func _ready():
	Bounds.left = left_bound.position.x
	Bounds.right = right_bound.position.x
	Bounds.top = top_bound.position.y
	Bounds.bottom = bottom_bound.position.y
