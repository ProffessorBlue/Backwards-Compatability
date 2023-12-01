extends CharacterBody2D

var SPEED = Defaults.player_speed
var ACCELERATION = Defaults.player_acceleration
var JUMP_VELOCITY = Defaults.player_jump_velocity
var FRICTION = Defaults.player_friction
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


@onready var playeranimations = $playeranimations
@onready var jump_sound = $"Game Music/Jump"
@onready var background_music = $"Game Music/Background Music"
var level_skin
#finding the player's skin at the start of the level
func _ready():
	var level_name = get_tree().current_scene.name
	level_skin = level_name.get_slice(" ",1)
	#Changes the player hitbox
	if level_skin == "WXP":
		$"Wxp Collision".disabled = false
		$PlayerCollisionBox.disabled = true
	else:
		$"Wxp Collision".disabled = true
		$PlayerCollisionBox.disabled = false
		
	
func _physics_process(delta):
	# Add the gravity.
	apply_gravity(delta)
	handle_jump(delta)
	var input_axis = Input.get_axis("ui_left","ui_right")
	handle_acceleration(input_axis, delta)
	apply_friction(input_axis,delta)
	update_animations(input_axis)
	move_and_slide()

func apply_gravity(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

func handle_jump(delta):
	if is_on_floor():
		if Input.is_action_just_pressed("ui_accept"):
			velocity.y += JUMP_VELOCITY
			jump_sound.play()
			

func handle_acceleration(input_axis,delta):
	if input_axis != 0:
		velocity.x = move_toward(velocity.x,SPEED*input_axis,ACCELERATION)

func apply_friction(input_axis,delta):
	if input_axis == 0:
		velocity.x = move_toward(velocity.x,0,FRICTION)

	
func update_animations(input_axis):
	if input_axis != 0:
		playeranimations.flip_h = input_axis < 0
		playeranimations.play(level_skin + " Run")
	else:
		playeranimations.play(level_skin + " Idle")
		
	if not is_on_floor():
		playeranimations.play(level_skin + " Jump")
