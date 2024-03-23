extends CharacterBody2D


const SPEED = 300.0

func _process(delta):
	rotation_degrees += 5

func _physics_process(delta):
	var collide = move_and_collide(Vector2.DOWN * SPEED * delta)
	if collide:
		if self.get_meta("Index") == 0:
			GlobalInfo.Points += 100 
		elif self.get_meta("Index") == 1:
			GlobalInfo.Points += 0
		elif self.get_meta("Index") == 2:
			GlobalInfo.Points += 50
		elif self.get_meta("Index") == 3:
			GlobalInfo.Points -= 100
		print(GlobalInfo.Points)
		queue_free()

func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()
