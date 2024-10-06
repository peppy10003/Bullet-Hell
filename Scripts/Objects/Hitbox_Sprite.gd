extends Sprite2D

func _physics_process(delta):
	if Input.get_action_strength("Focus"):
		self.visible = true
	else:
		self.visible = false
