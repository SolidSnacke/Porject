extends Node

var List_cards = {}
var List_wins_losses = {"losses": 0, "wins": 0}
var y1 = 250
var y2 = 425
var List_coordinates = [350,500,650,800]
var List_coordinates_objects = [576,384,192,768,960]
var AudioPos = 0
var Points = 0


func Random_coordinates(list):
	while len(list) != len(List_coordinates):
		randomize()
		var num = List_coordinates[randi() % List_coordinates.size()]
		if num not in list:
			list.append(num)

func Reload():
	get_tree().reload_current_scene()
	List_cards.clear()
