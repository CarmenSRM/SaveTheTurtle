extends VBoxContainer

@export var Next = preload("res://Intro_2.tscn") as PackedScene

func _ready():
	pass 

func _process(delta):
	pass

func _on_continuar_pressed():
	get_tree().change_scene_to_packed(Next)
