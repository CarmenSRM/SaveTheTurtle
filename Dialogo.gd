extends Sprite2D

@export var texto:String = "": 
	set(value):
		visible = true
		texto = value
		$Timer.start()

var index = 0;

func _on_timer_timeout():
	if index >= texto.length():
		visible = false 
		$Label.text = ""
		index = 0
		$Timer.stop()
	else:
		$Label.text = $Label.text + texto[index]
		index += 1
