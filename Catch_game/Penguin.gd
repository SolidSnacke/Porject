extends CharacterBody2D

var animation: AnimatedSprite2D

func _ready():
	animation = $AnimatedSprite2D
	animation.play("default")

func _input(event):
	if event is InputEventKey and event.keycode == KEY_D and event.is_pressed():
		if(self.position.x + 192 <= 1100):
			self.position.x += 192
			$AudioStreamPlayer2D.play()
	elif event is InputEventKey and event.keycode == KEY_A and event.is_pressed():
		if(self.position.x - 192 >= 52):
			self.position.x -= 192
			$AudioStreamPlayer2D.play()
