extends CharacterBody2D

const Base_Speed = 5
const Focus_Speed = 2.5

func _physics_process(delta):
	var input_vector = Vector2(0,0)
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	velocity = (input_vector * ((Focus_Speed * int(Input.get_action_strength("Focus"))) + (Base_Speed * int(!Input.get_action_strength("Focus")))))
	move_and_collide(velocity)
	
