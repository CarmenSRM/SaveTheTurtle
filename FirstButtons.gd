extends VBoxContainer

@export var Next = preload("res://NivelUno.tscn") as PackedScene
@export var Info = preload("res://Win.tscn") as PackedScene
# Creación de variables para las escenas
# Se guardan las escenas a las cuales harán referencia. 
func _ready():
	pass # No contiene nada 

func _process(delta):
	pass  # No contiene nada 

func _on_start_pressed(): # Se usa esto que se asigna desde los nodos de los botones (Funciones que ya contiene goodot)
	get_tree().change_scene_to_packed(Next) # Hace el cambio de escena en base al valor almacenado en la variable 

func _on_info_pressed():
	get_tree().change_scene_to_packed(Info) # Hace el cambio de escena en base al valor almacenado en la variable
