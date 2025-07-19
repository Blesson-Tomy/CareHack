extends CharacterBody2D
@onready var animation = $AnimatedSprite2D
@onready var collider = $CollisionShape2D
var gravity = 50.0
func _ready():
	collider.disabled = true
	animation.play("Sun")
func _physics_process(delta):
	velocity.y += gravity * delta
	move_and_slide()

