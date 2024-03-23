extends Area2D

var animation : AnimatedSprite2D
var f = true

func _ready():
	# Получаем ссылку на AnimationPlayer
	animation = $AnimatedSprite2D
	$Timer.start()
	animation.play("Open")

# Этот метод будет вызываться при нажатии на объект мышью
func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
		change_card()

func change_card():
	if f:
		animation.play("Open")
		f = false
		GlobalInfo.List_cards[self.name] = self.get_meta("Index")
		$AudioStreamPlayer2D.play()
		print(len(GlobalInfo.List_cards))
		print(GlobalInfo.List_cards.values())
	else:
		animation.play("Hide")
		f = true
		GlobalInfo.List_cards.erase(str(self.name))
		$AudioStreamPlayer2D.play()
		print(len(GlobalInfo.List_cards))
		print(GlobalInfo.List_cards.values())


func _on_timer_timeout():
	animation.play("Hide")
