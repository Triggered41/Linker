tool
extends Node2D

export(int, 1, 50) var traps_number := 0
export(int, 47, 200) var spacing := 55.0
var current_space = 47.0
var kill_once = true

func _ready():
	if !Engine.editor_hint:
		update_spikes()

func _physics_process(delta):
	if Engine.editor_hint:
		if get_child_count() != traps_number or spacing != current_space:
			update_spikes()

func _on_Spikes_body_entered(body):
	if body.is_in_group("player") and body.has_method("kill") and !Engine.editor_hint:
		if kill_once:
			kill_once = false
			body.kill()
			disable_trap()

func disable_trap():
	for i in get_child_count():
		get_child(i).get_node("AnimatedSprite").playing = false
		get_child(i).get_node("AnimatedSprite").frame = 0
		get_child(i).get_node("CollisionShape2D").queue_free()
		get_child(i).get_node("AnimationPlayer").queue_free()

func update_spikes():
	for i in get_child_count():
		get_child(i).queue_free()
	
	for i in traps_number:
		var trap = load("res://Assets/indi_Spikes.tscn")
		var spike = trap.instance() as Area2D
		spike.connect("body_entered", self, "_on_Spikes_body_entered")
		add_child(spike)
		spike.position.x = spacing * i
	current_space = spacing
