extends Node

signal game_over

# moedas e score
var coins: int = 0
var score: int = 0

# sistema de corações
var max_hearts: int = 3
var hearts: int = 3

# sistema de vida
var max_hits_per_heart: int = 10
var hits: int = 10

# tempo
var time_left: float = 300.0

var player = null

var current_checkpoint = null

var temp_position = null

func respawn_player():
	if current_checkpoint != null:
		player.global_position = current_checkpoint.global_position
	elif temp_position != null:
		player.global_position = temp_position.global_position

func _process(delta):
	if time_left > 0:
		time_left -= delta
	else:
		time_left = 0
		game_over.emit()
