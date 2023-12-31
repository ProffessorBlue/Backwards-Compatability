extends CharacterBody2D
var JUMP = -(Defaults.player_jump_velocity)


var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	if Input.is_action_just_pressed("ui_accept"):
		global_position += Vector2.UP * delta * JUMP
	
