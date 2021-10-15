extends Node

onready var SM = get_parent()
onready var player = get_node("../..")

func _ready():
	yield(player, "ready")

func start():
	player.set_animation("Kicking")

func physics_process(_delta):
	if not player.animating:
		var kick = player.get_node("Attack/Kick")
		if kick.is_colliding():
			var enemy = kick.get_collider()
			if enemy.has_method("damage"):
				enemy.damage(player.light_kick)
		SM.set_state("Idle")
