extends Node

var Random_seed :int = 0
var Random_select :int = 0
var Character_select :int = 0

var Seed_counter = 0

func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout

func start_stage_1(character: int):
	Global.Random_seed = randi_range(1000000000,9999999999)
	#need to save rng seed...
	seed(Random_seed)
	Global.Character_select = character
	get_tree().change_scene_to_file("res://Scenes/Stages/Stage_1.tscn")
