extends VBoxContainer

@export var Next = preload("res://intro_0_2.tscn") as PackedScene
#@export var Info = preload("res://Win.tscn") as PackedScene
# Creación de variables para las escenas
# Se guardan las escenas a las cuales harán referencia. 
func _ready():
	pass # No contiene nada 

func _process(delta):
	pass  # No contiene nada 

func _on_comenzar_pressed():
	get_tree().change_scene_to_packed(Next)
