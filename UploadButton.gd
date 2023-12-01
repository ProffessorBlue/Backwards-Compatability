extends Area2D
@onready var level_done = false
@onready var animation = $AnimatedSprite2D
func _ready():
	Events.glitches_fixed.connect(on_glitches_fixed)
func _physics_process(_delta):
	animation.play("default")
func on_glitches_fixed():
	level_done=true
func _on_body_entered(_body):
	if level_done == true:
		Events.level_complete.emit()
