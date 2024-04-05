extends VBoxContainer

@export var Next = preload("res://release.tscn") as PackedScene
@export var Info = preload("res://seastrash.tscn") as PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_pressed():
	get_tree().change_scene_to_packed(Next) 


func _on_info_pressed():
	get_tree().change_scene_to_packed(Info) 
