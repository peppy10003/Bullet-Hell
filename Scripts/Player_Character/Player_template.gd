extends CharacterBody2D

const Base_Speed = 5
const Focus_Power = 0.5

func _physics_process(delta):
	var input_vector = Vector2(0,0)
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	if (Focus_Power * Input.get_action_strength("Focus")) == 0:
		velocity = (input_vector * Base_Speed) * Focus_Power
	velocity = (input_vector * Base_Speed)
	move_and_collide(velocity)
