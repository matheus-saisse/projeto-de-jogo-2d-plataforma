extends Area2D

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D

var activated = false

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	anim.stop()

func _on_body_entered(body):
	if body.is_in_group("player") and not activated:
		activated = true
		Globals.current_checkpoint = self
		anim.play("checkpoint")
		print("checkpoint ativado")
