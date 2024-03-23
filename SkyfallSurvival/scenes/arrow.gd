extends Area2D

func _process(delta):
	position.y += 5



func _on_area_entered(area):
	if area.name == "stop":
		queue_free()
		
		



func _on_body_entered(body):
	if body.name == "Character" && GameManager.health > 0:
		GameManager.health -=1
		queue_free()
		
