extends Area2D

func _process(delta):
	position.y += 6


func _on_body_entered(body):
	if (body.name == "Character"):
		if GameManager.health < 3 and GameManager.health > 0:
			GameManager.health += 1
		elif GameManager.health == 3:
			GameManager.points += 10
		queue_free()


