extends Control

var address = ""
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_exit_pressed():
	$ButtonSound.play()
	$Timer.start()
	address = "res://Menu/Main_menu.tscn"


func _on_cards_pressed():
	$ButtonSound.play()
	$Timer.start()
	address = "res://Cards_game/Game_Card.tscn"


func _on_catch_pressed():
	$ButtonSound.play()
	$Timer.start()
	address = "res://Catch_game/game_catch.tscn"


func _on_timer_timeout():
	Change_scene()

func Change_scene():
	get_tree().change_scene_to_file(address)
