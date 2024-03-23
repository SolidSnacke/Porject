extends Node2D

var List_coordinates_1 = []
var List_coordinates_2 = []
var List_card = [preload("res://Cards_game/Cards/Card_Empty.tscn"), 
preload("res://Cards_game/Cards/Card_Fish.tscn"), 
preload("res://Cards_game/Cards/Card_Penguin.tscn"), 
preload("res://Cards_game/Cards/Card_Rock.tscn"), 
preload("res://Cards_game/Cards/Card_Sky.tscn"), 
preload("res://Cards_game/Cards/Card_Star.tscn")]
# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalInfo.Random_coordinates(List_coordinates_1)
	GlobalInfo.Random_coordinates(List_coordinates_2)
	Random_card()
	$Timer2.start()
	$Control.mouse_filter = 0
	$Win_01.text = str(GlobalInfo.List_wins_losses["wins"] % 10)
	$Win_10.text = str(GlobalInfo.List_wins_losses["wins"] / 10)
	$Lose.text = str(GlobalInfo.List_wins_losses["losses"])
	$AudioStreamPlayer2D.play(GlobalInfo.AudioPos)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if len(GlobalInfo.List_cards) == 2 and $Timer.time_left == 0:
		$Timer.start()
		$Control.mouse_filter = 0
	

func _input(event):
	if event is InputEventKey and event.keycode == KEY_R:
		get_tree().reload_current_scene()

func _on_timer_timeout():
	var val = GlobalInfo.List_cards.values()
	var keys = GlobalInfo.List_cards.keys()
	if val[0] == val[1]:
		GlobalInfo.List_wins_losses["wins"] += 1
		GlobalInfo.List_wins_losses["losses"] = 0
		$Win_01.text = str(GlobalInfo.List_wins_losses["wins"] % 10)
		$Win_10.text = str(GlobalInfo.List_wins_losses["wins"] / 10)
		$Lose.text = str(GlobalInfo.List_wins_losses["losses"])
		if(GlobalInfo.List_wins_losses["wins"] % 4 == 0):
			GlobalInfo.Reload()
			GlobalInfo.AudioPos = $AudioStreamPlayer2D.get_playback_position()
		get_node(keys[0]).queue_free()
		get_node(keys[1]).queue_free()
		GlobalInfo.List_cards.clear()
	else:
		GlobalInfo.List_wins_losses["losses"] += 1
		$Lose.text = str(GlobalInfo.List_wins_losses["losses"])
		if(GlobalInfo.List_wins_losses["losses"] > 3):
			GlobalInfo.List_wins_losses["losses"] = 0
			GlobalInfo.List_wins_losses["wins"] = 0
			GlobalInfo.Reload()
			GlobalInfo.AudioPos = $AudioStreamPlayer2D.get_playback_position()
		get_node(keys[0]).change_card()
		get_node(keys[1]).change_card()
	$Control.mouse_filter = 2

func Random_card():
	var num = 0
	while num != 4:
		randomize()
		var name_num = randi() % List_card.size()
		var card = List_card[name_num].instantiate()
		if self.has_node(str(card.name)) != true:
			var card_dub = List_card[name_num].instantiate()
			card.position.x = List_coordinates_1[num]
			card.position.y = GlobalInfo.y1
			card_dub.position.x = List_coordinates_2[num]
			card_dub.position.y = GlobalInfo.y2
			print(card.name)
			add_child(card)
			add_child(card_dub)
			num += 1
		else:
			card.queue_free()


func _on_timer_2_timeout():
	$Control.mouse_filter = 2
