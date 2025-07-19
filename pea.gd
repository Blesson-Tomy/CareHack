extends CharacterBody2D
@onready var animation  = $AnimatedSprite2D
func _ready():
	animation.play("Idle")
