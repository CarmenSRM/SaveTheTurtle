extends Area2D

@export var Win1 = preload("res://Win.tscn") as PackedScene

@export var Win2 = preload("res://Fin.tscn") as PackedScene

func _ready():
	pass 

func _process(delta):
	pass


func _on_body_entered(body):
	if "BabyFred" in body.get_name():
		get_tree().change_scene_to_packed(Win1) #Cambio de escena. 
	elif "fred_swimer" in body.get_name():
		get_tree().change_scene_to_packed(Win2) #Cambio de escena. 
		
