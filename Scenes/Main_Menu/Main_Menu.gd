extends Control
# https://www.youtube.com/watch?v=3lgjj7Wccyw&t=1076s
var menu_trans_time := 0.5

var menu_origin_pos := Vector2.ZERO
var menu_origin_size := Vector2.ZERO

var current_menu
var menu_stack := []

@onready var menu_1 = $Main_Menu
@onready var menu_2 = $Start_Menu
@onready var tween = $Tween

var random = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	menu_origin_pos = Vector2(0,0)
	menu_origin_size = get_viewport_rect().size
	current_menu = menu_1

func move_to_next_menu(next_menu_id: String):
	var next_menu = get_menu_from_menu_id(next_menu_id)
	var tween = create_tween()
	tween.parallel().tween_property(current_menu,"global_position",Vector2(-menu_origin_size.x, 0),menu_trans_time)
	tween.parallel().tween_property(next_menu,"global_position",menu_origin_pos,menu_trans_time)
	menu_stack.append(current_menu)
	current_menu = next_menu
	
	
func move_to_prev_menu():
	var prev_menu = menu_stack.pop_back()
	var tween = create_tween()
	if prev_menu != null:
		tween.parallel().tween_property(prev_menu,"global_position",menu_origin_pos,menu_trans_time)
		tween.parallel().tween_property(current_menu,"global_position",Vector2(menu_origin_size.x,0),menu_trans_time)
		current_menu = prev_menu

func get_menu_from_menu_id(menu_id: String) -> Control:
		match menu_id:
			"menu_1":
				return menu_1
			"menu_2":
				return menu_2
			_:
				return menu_1

func _on_start_button_pressed():
	move_to_next_menu("menu_2")

func _on_start_back_button_pressed():
	move_to_prev_menu()
	
#----- select character -----#
func _on_player_1_pressed():
	Global.start_stage_1(1)
