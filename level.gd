extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 0
const DEF_SPEED = 1000
# Called when the node enters the scene tree for the first time.
func _ready():
	PlayerController.connect("playerImpulse", self, "jump")
	PlayerController.connect("stopJump", self, "stopJump")
	pass # Replace with function body.

func jump():
	print("jump")
	speed = DEF_SPEED
	
func stopJump():
	print("stopJump")
	speed = 0
	
func _process(delta):
	position.y += speed * delta

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	pass # Replace with function body.
