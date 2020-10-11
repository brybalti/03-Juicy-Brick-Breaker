extends StaticBody2D

var strength = 3
var points = 100

var dying = false

func _physics_process(_delta):
	if dying:
		queue_free()

func set_strength(s):
	if s <= 0:
		die()
		
	strength = s
	var x = strength * 385
	$Sprite.region_rect = Rect2(x, 0, 385, 131)
	points = strength * 385

func damage(d):
	set_strength(strength - 1)
	Global.update_score(points)

func die():
	dying = true

func _ready():
	pass
