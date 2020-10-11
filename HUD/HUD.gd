extends Control

var time = 0

func _ready():
	Global.connect("changed",self,"on_Global_changed")
	update_score()
	update_lives()
	update_time()

func update_score():
	$Score.text = "Score: " + str(Global.score)

func update_lives():
	$Lives.text = "Lives: " + str(Global.lives)

func update_time():
	$Time.text = "Time: " + str(time)

func _on_Timer_timeout():
	time += 1
	update_time()

func on_Global_changed():
	update_score()
	update_lives()
