extends KinematicBody2D

const MAX_VEL = 300
const JUMP_FORCE = 1500
const SPEED_LIMIT = 3000
const G = 50
var vel = Vector2(0,0)
var isAtk = false
var initPos = Vector2()
# Called when the node enters the scene tree for the first time.
func _ready():
	initPos = position
	$atkArea.disableColision()
	PlayerController.connect("playerImpulse", self, "jump")
	pass # Replace with function body.

func jump(): 
	vel.y = -JUMP_FORCE
	
func _unhandled_input(event):
	if (event is InputEventScreenTouch or event is InputEventMouseButton):
		isAtk = true
		$atkArea.enableColision()
		$AnimatedSprite.play("atk")
		pass
		
func _physics_process(delta):
	var lastVely = vel.y
	vel.y += G
	print(vel.y)
	if vel.y >= 0 and lastVely <= 0:
		PlayerController.stopJump()
	if vel.y > SPEED_LIMIT:
		vel.y = SPEED_LIMIT
	var movX = Input.get_action_strength("left") - Input.get_action_strength("right")
	var rotation = Input.get_accelerometer()
	vel.x = (rotation.x + movX ) * 1000
	if position.x > get_viewport().size.x and vel.x > 0 :
		vel.x = 0
	if position.x < 0 and vel.x < 0:
		vel.x = 0 
		
	move_and_collide(vel * delta)
	
	


func _on_AnimatedSprite_animation_finished():
	isAtk = false
	$atkArea.disableColision()
	$AnimatedSprite.play("idle")
	pass # Replace with function body.


func _on_VisibilityNotifier2D_screen_exited():
	position = initPos
	pass # Replace with function body.
