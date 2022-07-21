extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const NEW_LEVEL_POS = Vector2(0, -3600)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func instanceChild(y):
	print("instance")
	var levelNode = load("res://scenes/level.tscn").instance()
	add_child(levelNode)
	levelNode.position = NEW_LEVEL_POS
	levelNode.position.y += y
	levelNode.z_index = -1;
	
func addLevel():
	
	var maxy = INF
	var c_count = 0;
	for _i in self.get_children():
		if _i.name != "Player":
			c_count +=1
			if _i.position.y < maxy:
				maxy = _i.position.y
				
	if c_count < 3:
		var levelNode = load("res://scenes/level.tscn").instance()
		add_child(levelNode)
		levelNode.position = NEW_LEVEL_POS
		levelNode.position.y += maxy 
		levelNode.z_index = -1;
		pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
