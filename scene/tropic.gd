extends Node2D
@onready var gameover := preload("res://scene/gameover.tscn")
@onready var player: CharacterBody2D = $player
@onready var player_scene = preload("res://entitys/player.tscn")

func _ready():
	Globals.temp_position = $Marker2D
	Globals.player = player
	Globals.game_over.connect(show_game_over)

func show_game_over():
	if get_tree().paused:
		return

	var game_over_scene = preload("res://scene/gameover.tscn").instantiate()
	add_child(game_over_scene)
	get_tree().paused = true

	
func reload_game():
	var player = player_scene.instantiate()
	add_child(player)
	Globals.player = player
	Globals.respawn_player()
