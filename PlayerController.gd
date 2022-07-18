extends Node


signal playerImpulse()
signal stopJump()

func impulsePlayer():
	emit_signal("playerImpulse")

func stopJump():
	print("sj")
	emit_signal("stopJump")
	
