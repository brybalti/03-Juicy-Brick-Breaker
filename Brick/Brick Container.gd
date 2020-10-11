extends Node2D

onready var Brick = load("res://Brick/Brick.tscn")
var rows = 5
var columns = 7

onready var VP = get_viewport_rect().size
var B = Vector2(100,50)


func _ready():
	start()

func _physics_process(_delta):
	if get_child_count() == 0:
		Global.update_level(1)
		start()

func start():
	for c in get_children():
		c.queue_free()
	
	var startx = (VP.x / 2) - ((B.x) * (columns / 2))
	var starty = 50
	
	for r in rows:
		for c in columns:
			var x = startx + (c * B.x)
			var y = starty + (r * B.y)
			var brick = Brick.instance()
			brick.position = Vector2(x,y)
			brick.set_strength((rows-1) - r)
			add_child(brick)
