extends VBoxContainer

@export var Next = preload("res://Inicio.tscn") as PackedScene

@export var Back = preload("res://Intro1.tscn") as PackedScene

func _ready():
	pass 

func _process(delta):
	pass

func _on_salir_pressed():
	get_tree().change_scene_to_packed(Next)

func _on_repetir_pressed():
	get_tree().change_scene_to_packed(Back)
