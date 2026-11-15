extends Node2D

@onready var player = %player
@onready var food = [preload("res://scenes/isopod.tscn")]
@onready var bar_stomach = $screen/ui/background/bar_stomach
@onready var text_stomach = $screen/ui/background/text_stomach
@onready var text_storage = $screen/ui/background/text_storage
var score = 0
var storage = 0
var max_storage = 50

func _ready():
	for i in 100:
		var thing = food.pick_random().instantiate()
		thing.global_position = Vector2(randi_range(-1260, 2540), randi_range(-1260, 2540))
		add_child(thing)
		
func _process(delta_):
	if Input.is_action_just_pressed("ESC"):
		get_tree().change_scene_to_file("res://scenes/menu.tscn")
	if player.stomach <= -10:
		$screen/finish.show()
		get_tree().paused = true
	bar_stomach.value = player.stomach
	text_stomach.text = "Stomach: " + str(player.stomach) + "/" + str(player.max_stomach)
	text_storage.text = "Storage: " + str(storage) + "/" + str(max_storage)
