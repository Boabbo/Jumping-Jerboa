extends Area2D

@onready var player = %player
@onready var base = get_parent()

func _on_body_entered(body):
	if body is Player:
		if player.stomach > 0 and base.storage + player.stomach < base.max_storage:
			base.storage += player.stomach
			player.stomach = 0
		elif player.stomach < 0 and base.storage > 0:
			player.stomach += 1
			base.storage -= 1
