extends Node


signal playerImpulse()
signal stopJump()
signal levelPassed()
signal playerJump(vel)

func impulsePlayer():
	emit_signal("playerImpulse")
	
func playerJump(vel):
	emit_signal("playerJump", vel)
	
func stopJump():
	print("sj")
	emit_signal("stopJump")
	
func levelPassed():
	emit_signal("levelPassed")
