extends Area2D

@onready var base = get_tree().current_scene
@onready var player = get_tree().current_scene.get_node("player")

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		if player.stomach < player.max_stomach:
			player.stomach += 1
		global_position = Vector2(randi_range(-1260, 2540), randi_range(-1260, 2540))
