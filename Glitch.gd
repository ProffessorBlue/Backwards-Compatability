extends Area2D
var level_animation
@onready var animation_set = $sprites
@onready var sound = $"pickup animation"
func _ready():
	#An animation is selected depending on the level,
	#a random frame is chosen from that set and is displayed as that object's texture.
	
	#This fetches the level name, and says what animation a frame will be chosen from.
	var level_name = get_tree().current_scene.name
	level_animation = level_name.get_slice(" ",1)
	#gets the number of frames in the animation
	var no_of_frames = animation_set.sprite_frames.get_frame_count(level_animation)
	#fetches random number
	var frame = randi() % (no_of_frames)
	animation_set.animation = level_animation
	animation_set.frame = frame
	
func _on_body_entered(_body):
	sound.play("picked")
	var glitches = get_tree().get_nodes_in_group("Glitches")
	if glitches.size()==1:
		Events.glitches_fixed.emit()
