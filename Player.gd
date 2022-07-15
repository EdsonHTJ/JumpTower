extends KinematicBody2D

const MAX_VEL = 300
const JUMP_FORCE = 3000
const G = 50
var vel = Vector2(0,0)
var isAtk = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _unhandled_input(event):
	if (event is InputEventScreenTouch or event is InputEventMouseButton):
		print("Click")
		vel.y = -JUMP_FORCE
		isAtk = true
		$AnimatedSprite.play("atk")
		pass
		
func _physics_process(delta):
	vel.y += G
	var rotation = Input.get_gyroscope()
	print(rotation)
	vel.x = -rotation.z * 1000
	if position.x > get_viewport().size.x and vel.x > 0 :
		vel.x = 0
	if position.x < 0 and vel.x < 0:
		vel.x = 0 
		
	move_and_collide(vel * delta)
	
	


func _on_AnimatedSprite_animation_finished():
	isAtk = false
	$AnimatedSprite.play("idle")
	pass # Replace with function body.
