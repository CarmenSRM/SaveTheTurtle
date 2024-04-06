extends Area2D

func _ready():
	$AnimatedSprite2D.play("100points")

func _process(delta):
	pass

func _on_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	hide()
	$CollisionShape2D.set_deferred("disabled", true)
