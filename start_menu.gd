extends CenterContainer
@onready var background = $VBoxContainer/background
var game_start

func _ready():
	game_start = false

func _physics_process(_delta):
	if game_start == false:
		background.play("idle")
		
func _on_start_game_pressed():
	game_start = true
	$AnimationPlayer.play("start game")
	
func start_game():
	get_tree().change_scene_to_file("res://Scenes/Level/Tutorial.tscn")

func _on_quit_pressed():
	get_tree().quit()
