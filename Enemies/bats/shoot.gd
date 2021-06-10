extends Node2D

onready var bat = get_parent()
onready var attack_timer = $attack_timer
export  var projectile:PackedScene 

func _physics_process(delta):
	if bat.target:
		look_at(bat.target.global_position)

func _on_attack_timer_timeout():
	var project = projectile.instance()
	get_tree().root.add_child(project)
	project.global_position = $fp.global_position
	project.global_rotation = global_rotation
