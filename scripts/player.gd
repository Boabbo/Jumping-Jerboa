extends CharacterBody2D
class_name Player

@export var SPEED = 300.0
@onready var skin = $skin
@export var max_stomach := 10
var stomach = 0
var hunger_time := 0.0

func _process(delta):
	hunger_time += delta
	if hunger_time >= 5:
		hunger_time = 0
		stomach -= 1
	if velocity.x > 0:
		skin.flip_h = false
	elif velocity.x < 0:
		skin.flip_h = true
	if velocity.length() <= 0.01:
		skin.play("idle")
	elif velocity.length() > 0.01:
		skin.play("walking")

func _physics_process(delta_):
	var input_direction := Input.get_vector("A", "D", "W", "S")
	if input_direction:
		velocity = input_direction * SPEED
	else:
		velocity = Vector2(move_toward(velocity.x, 0, SPEED), move_toward(velocity.y, 0, SPEED))
	move_and_slide()
