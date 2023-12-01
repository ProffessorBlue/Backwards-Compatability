extends Node2D
@onready var upload_button = $UploadButton
@export var next_level : PackedScene
func _ready():
	Events.glitches_fixed.connect(spawn_upload_button)
	Events.level_complete.connect(finish_level)
	
func spawn_upload_button():
	upload_button.show()
	
func finish_level():
	if not next_level is PackedScene:return
	get_tree().change_scene_to_packed(next_level)
