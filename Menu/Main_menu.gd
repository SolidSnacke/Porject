extends Control

var address = ""
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_exit_pressed():
	$ButtonSound.play()
	$Timer.start()
	get_tree().quit() # Replace with function body.


func _on_settings_pressed():
	$ButtonSound.play()
	$Timer.start()
	address =  "res://Menu/Settings_menu.tscn"


func _on_play_pressed():
	$ButtonSound.play()
	$Timer.start()
	address = "res://Menu/Play_Menu.tscn"


func _on_timer_timeout():
	Change_scene()

func Change_scene():
	get_tree().change_scene_to_file(address)
