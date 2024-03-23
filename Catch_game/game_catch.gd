extends Node2D

var List_Object = [preload("res://Catch_game/Fish.tscn"), 
	preload("res://Catch_game/Star.tscn"), 
	preload("res://Catch_game/Bottle.tscn"), 
	preload("res://Catch_game/Rock.tscn")]
	
# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Penguin").position.x = 1152 / 2
	get_node("Penguin").position.y = 469
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Label.text = str(GlobalInfo.Points)
	randomize()
	if $Timer.time_left == 0:
		$Timer.start(randf_range(0,1.5))


func _Random_object():
	randomize()
	var name_num = randi() % List_Object.size()
	var object = List_Object[name_num].instantiate()
	object.position.x = GlobalInfo.List_coordinates_objects[randi() % GlobalInfo.List_coordinates_objects.size()]
	add_child(object)
			


func _on_timer_timeout():
	_Random_object()# Replace with function body.
