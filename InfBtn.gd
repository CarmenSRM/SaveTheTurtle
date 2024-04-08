extends VBoxContainer

@export var Back = preload("res://Inicio.tscn") as PackedScene

func _ready():
	pass 

func _process(delta):
	pass

func _on_button_pressed():
	get_tree().change_scene_to_packed(Back)
