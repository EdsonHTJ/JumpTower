extends Node2D
class_name Level

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 0
const DEF_SPEED = 1000
var lastPos = -INF
# Called when the node enters the scene tree for the first time.

func _ready():
	PlayerController.connect("playerJump", self, "jump")
	PlayerController.connect("stopJump", self, "stopJump")
	pass # Replace with function body.

func jump(force):
	speed = -force
	
func stopJump():
	speed = 0
	
func _physics_process(delta):
	if  lastPos > -1000 and lastPos < -500 and self.position.y > -500:
		get_parent().instanceChild(self.position.y)
	lastPos = self.position.y
	position.y += speed * delta

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_VisibilityNotifier2D_screen_exited():
	PlayerController.levelPassed()
	queue_free()
	pass # Replace with function body.
