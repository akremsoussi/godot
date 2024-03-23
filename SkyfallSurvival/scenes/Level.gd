extends Node2D






var collectable = preload("res://scenes/collectable.tscn")
var arrow_scene = preload("res://scenes/arrow.tscn")

@onready var display = %Display
@onready var label = %Label
@onready var heart_1 = %heart1
@onready var heart_3 = %heart3
@onready var heart_2 = %heart2
@onready var pause_menu = %PauseMenu




func _ready():
	get_tree().paused = false


func _process(delta):
	if GameManager.health == 3:
		heart_1.animation = "default"
		heart_2.animation = "default"
		heart_3.animation = "default"
	elif GameManager.health == 2:
		heart_1.animation = "default"
		heart_2.animation = "default"
		heart_3.animation = "hit"
	elif GameManager.health == 1:
		heart_1.animation = "default"
		heart_2.animation = "hit"
		heart_3.animation = "hit"
	elif GameManager.health == 0:
		heart_1.animation = "hit"
		heart_2.animation = "hit"
		heart_3.animation = "hit"
	display.text = "Score : " +str(GameManager.points)
	
	if Input.is_action_pressed("pause"):
		pause_menu.toggle_pause()
	





func _on_timer_timeout():
	if GameManager.health != 0:
		var arrow = arrow_scene.instantiate()
		arrow.position = Vector2(randf_range(193,1216),-30)	
		add_child(arrow)


func _on_heal_timeout():
	if GameManager.health >0:	
		var banana = collectable.instantiate()
		banana.position = Vector2(randf_range(193,1216),-30)	
		add_child(banana)




func _on_time_score_timeout():
		if GameManager.health > 0:
			GameManager.timeScore +=1
			label.text = "Time : " + str(GameManager.timeScore) + "s"
	
	
	
	
	




func _on_pause_pressed():
	pause_menu.toggle_pause()
