extends Area2D

@export var Win = preload("res://Win.tscn") as PackedScene

func _ready():
	pass 

func _process(delta):
	pass


func _on_body_entered(body):
	if "BabyFred" in body.get_name():
		get_tree().change_scene_to_packed(Win) #Cambio de escena. 
